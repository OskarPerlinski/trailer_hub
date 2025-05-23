import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:trailer_hub/data/auth/datasource/email_data_source.dart';
import 'package:trailer_hub/data/auth/datasource/google_data_source.dart';
import 'package:trailer_hub/data/auth/datasource/reset_password_data_source.dart';
import 'package:trailer_hub/data/user/datasource/user_data_source.dart';
import 'package:trailer_hub/domain/auth/repository/auth_repository.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(
    this._emailDataSource,
    this._userDataSource,
    this._resetPasswordDataSource,
    this._googleDataSource,
  );

  final EmailDataSource _emailDataSource;
  final UserDataSource _userDataSource;
  final ResetPasswordDataSource _resetPasswordDataSource;
  final GoogleDataSource _googleDataSource;

  @override
  Future<UserCredential> signUpWithEmail(String email, String password) async {
    final userCredential = await _emailDataSource.signUpWithEmail(
      email,
      password,
    );
    final user = userCredential.user;

    if (user == null) {
      throw Exception("Email sign-up failed: user is null.");
    }

    final uid = user.uid;
    final exists = await _userDataSource.checkIfUserExists(uid);
    if (!exists) {
      await _userDataSource.createUser(uid, email);
    }

    return userCredential;
  }

  @override
  Future<UserCredential> signInWithEmail(String email, String password) async {
    return await _emailDataSource.signInWithEmail(email, password);
  }

  @override
  Future<void> resetPassword(String email) async {
    return await _resetPasswordDataSource.resetPassword(email);
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    final userCredential = await _googleDataSource.signInWithGoogle();

    final user = userCredential.user;

    if (user == null) {
      throw Exception("Google sign-in failed: user is null.");
    }

    final uid = user.uid;
    final email = user.email ?? "";

    final exists = await _userDataSource.checkIfUserExists(uid);
    if (!exists) {
      await _userDataSource.createUser(uid, email);
    }

    return userCredential;
  }
}

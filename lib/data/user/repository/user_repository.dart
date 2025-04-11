import 'package:injectable/injectable.dart';
import 'package:trailer_hub/data/user/datasource/user_data_source.dart';
import 'package:trailer_hub/domain/user/repository/user_repository.dart';

@Singleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._userDataSource);

  final UserDataSource _userDataSource;

  @override
  Future<bool> checkIfUserExists(String uid) async {
    return _userDataSource.checkIfUserExists(uid);
  }

  @override
  Future<void> createUser(String uid, String email) async {
    await _userDataSource.createUser(uid, email);
  }
}

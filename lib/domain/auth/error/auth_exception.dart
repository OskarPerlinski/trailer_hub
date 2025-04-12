import 'package:firebase_auth/firebase_auth.dart';

class AuthException implements Exception {
  AuthException({required this.message});

  final String message;

  factory AuthException.fromFirebase(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return AuthException(message: 'The email address is not valid.');
      case 'weak-password':
        return AuthException(message: 'The password is too weak.');
      case 'email-already-in-use':
        return AuthException(message: 'This email is already in use.');
      case 'invalid-credential':
        return AuthException(message: 'Wrong password or email.');
      default:
        return AuthException(message: 'An error occurred: ${e.message}');
    }
  }
}

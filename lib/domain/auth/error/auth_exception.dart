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
      case 'user-not-found':
        return AuthException(message: 'No user found with this email.');
      case 'wrong-password':
        return AuthException(message: 'Incorrect password.');
      default:
        return AuthException(message: 'An error occurred: ${e.message}');
    }
  }
}
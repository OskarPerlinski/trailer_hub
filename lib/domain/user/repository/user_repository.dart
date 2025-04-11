abstract class UserRepository {
  Future<void> createUser(String uid, String email);
  Future<bool> checkIfUserExists(String uid);
}
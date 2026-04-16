abstract class ProfileRepository {
  Future<void> updateLastActive(String uid, DateTime lastActive);
  Future<void> updateShiftStatus(String uid, String status);
}

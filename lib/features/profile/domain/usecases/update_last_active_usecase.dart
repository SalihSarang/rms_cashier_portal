import '../repositories/profile_repository.dart';

class UpdateLastActiveUseCase {
  final ProfileRepository _repository;

  UpdateLastActiveUseCase(this._repository);

  Future<void> call(String uid, DateTime lastActive) async {
    return await _repository.updateLastActive(uid, lastActive);
  }
}

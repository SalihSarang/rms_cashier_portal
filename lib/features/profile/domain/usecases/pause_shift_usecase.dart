import '../../domain/repositories/profile_repository.dart';

class PauseShiftUseCase {
  final ProfileRepository _repository;

  PauseShiftUseCase(this._repository);

  Future<void> call(String uid) async {
    return await _repository.updateShiftStatus(uid, 'paused');
  }
}

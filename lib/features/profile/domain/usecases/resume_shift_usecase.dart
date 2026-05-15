import '../../domain/repositories/profile_repository.dart';

class ResumeShiftUseCase {
  final ProfileRepository _repository;

  ResumeShiftUseCase(this._repository);

  Future<void> call(String uid) async {
    return await _repository.updateShiftStatus(uid, 'active');
  }
}

import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_datasource.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource;

  ProfileRepositoryImpl({required ProfileRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  @override
  Future<void> updateLastActive(String uid, DateTime lastActive) async {
    return await _remoteDataSource.updateLastActive(uid, lastActive);
  }

  @override
  Future<void> updateShiftStatus(String uid, String status) async {
    return await _remoteDataSource.updateShiftStatus(uid, status);
  }
}

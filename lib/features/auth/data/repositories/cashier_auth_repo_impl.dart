import 'package:rms_shared_package/models/staff_model/staff_model.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/cashier_auth_remote_datasource.dart';

class CashierAuthRepoImpl implements AuthRepository {
  final CashierAuthRemoteDataSource remoteDataSource;

  CashierAuthRepoImpl({required this.remoteDataSource});

  @override
  Future<StaffModel?> getCurrentCashier() async {
    return await remoteDataSource.getCurrentCashier();
  }

  @override
  Future<StaffModel?> signIn(String email, String password) async {
    return await remoteDataSource.signIn(email, password);
  }

  @override
  Future<void> signOut() async {
    return await remoteDataSource.signOut();
  }
}

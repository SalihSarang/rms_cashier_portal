import 'package:rms_shared_package/rms_shared_package.dart';
import 'package:cashier_portal/features/billing/domain/repositories/billing_repository.dart';
import 'package:cashier_portal/features/billing/data/datasources/billing_remote_datasource.dart';

class BillingRepositoryImpl implements BillingRepository {
  final BillingRemoteDataSource _remoteDataSource;

  BillingRepositoryImpl(this._remoteDataSource);

  @override
  Stream<List<OrderModel>> getBillingQueue() {
    return _remoteDataSource.getOrders();
  }

  @override
  Future<void> processPayment({
    required String orderId,
    required PaymentMethod method,
  }) async {
    return await _remoteDataSource.processPayment(orderId, method);
  }
}

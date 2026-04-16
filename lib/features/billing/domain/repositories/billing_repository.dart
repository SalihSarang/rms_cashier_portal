import 'package:rms_shared_package/rms_shared_package.dart';

abstract class BillingRepository {
  Stream<List<OrderModel>> getBillingQueue();
  Future<void> processPayment({
    required String orderId,
    required PaymentMethod method,
  });
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

abstract class BillingRemoteDataSource {
  Stream<List<OrderModel>> getOrders();
  Future<void> processPayment(String orderId, PaymentMethod method);
}

class BillingRemoteDataSourceImpl implements BillingRemoteDataSource {
  final FirebaseFirestore _firestore;

  BillingRemoteDataSourceImpl(this._firestore);

  @override
  Stream<List<OrderModel>> getOrders() {
    return _firestore
        .collection(OrderDbConstants.orders)
        .where(
          'orderStatus',
          isEqualTo: 'billRequested',
        )
        .snapshots()
        .map((snapshot) {
          final orders = snapshot.docs.map((doc) {
            return OrderModel.fromJson(doc.data());
          }).toList();

          // In-memory sorting: Newest orders first
          orders.sort((a, b) => b.createdAt.compareTo(a.createdAt));

          return orders;
        });
  }

  @override
  Future<void> processPayment(String orderId, PaymentMethod method) async {
    final batch = _firestore.batch();

    // 1. Update the master order document
    final orderRef = _firestore
        .collection(OrderDbConstants.orders)
        .doc(orderId);
    batch.update(orderRef, {
      'paymentStatus': PaymentStatus.paid.name,
      'orderStatus': OrderStatus.completed.name,
      'paymentMethod': method.name,
      'updatedAt': DateTime.now().toIso8601String(),
    });

    // 2. Cleanup: Delete the corresponding document from the kitchen queue
    final kitchenQueueRef = _firestore
        .collection(KitchenDbConstants.kitchenQueue)
        .doc(orderId);
    batch.delete(kitchenQueueRef);

    // Execute the transaction
    await batch.commit();
  }
}

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
        .where('paymentStatus', isEqualTo: PaymentStatus.pending.name)
        // Note: Removed .orderBy() here to avoid the requirement for a Composite Index in Firestore.
        // We sort the results in-memory instead for better initial developer experience.
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
    await _firestore.collection(OrderDbConstants.orders).doc(orderId).update({
      'paymentStatus': PaymentStatus.paid.name,
      'orderStatus': OrderStatus.completed.name,
      'paymentMethod': method.name,
      'updatedAt': DateTime.now().toIso8601String(),
    });
  }
}

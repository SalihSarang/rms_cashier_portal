import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

abstract class BillingRemoteDataSource {
  Stream<List<OrderModel>> getOrders();
  Future<void> processPayment(OrderModel order, PaymentMethod method);
}

class BillingRemoteDataSourceImpl implements BillingRemoteDataSource {
  final FirebaseFirestore _firestore;

  BillingRemoteDataSourceImpl(this._firestore);

  @override
  Stream<List<OrderModel>> getOrders() {
    return _firestore
        .collection(OrderDbConstants.orders)
        .where('orderStatus', isEqualTo: 'billRequested')
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
  Future<void> processPayment(OrderModel order, PaymentMethod method) async {
    return _firestore.runTransaction((transaction) async {
      // 1. Reference the master order document
      final orderRef = _firestore
          .collection(OrderDbConstants.orders)
          .doc(order.id);

      // 2. Reference the kitchen queue document
      final kitchenQueueRef = _firestore
          .collection(KitchenDbConstants.kitchenQueue)
          .doc(order.id);

      // 3. Reference the table document
      final tableRef = _firestore
          .collection(TableDbConstants.tables)
          .doc(order.tableId);

      // Fetch the table document to get current occupancy
      final tableSnapshot = await transaction.get(tableRef);

      // Update order
      transaction.update(orderRef, {
        'paymentStatus': PaymentStatus.paid.name,
        'orderStatus': OrderStatus.completed.name,
        'paymentMethod': method.name,
        'updatedAt': FieldValue.serverTimestamp(),
      });

      // Cleanup kitchen queue
      transaction.delete(kitchenQueueRef);

      // Update table occupancy
      if (tableSnapshot.exists) {
        final tableData = tableSnapshot.data() as Map<String, dynamic>;
        final currentOccupied = (tableData['occupiedSeats'] as num? ?? 0)
            .toInt();
        final newOccupied = currentOccupied - order.seatCount;

        final updates = <String, dynamic>{
          'occupiedSeats': newOccupied < 0 ? 0 : newOccupied,
        };

        // If seats become 0 or negative, set table to available
        if (newOccupied <= 0) {
          updates['status'] = TableStatus.available.name;
        }

        transaction.update(tableRef, updates);
      }
    });
  }
}

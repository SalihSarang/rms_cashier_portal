import 'package:rms_shared_package/rms_shared_package.dart';

/// Abstract interface for printing customer receipts.
abstract class ReceiptPrintingRepository {
  /// Generates and prints a receipt for the given [order].
  Future<void> printReceipt(OrderModel order);
}

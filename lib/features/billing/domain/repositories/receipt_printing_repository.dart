import 'package:rms_shared_package/rms_shared_package.dart';

/// Abstract interface for printing customer receipts.
abstract class ReceiptPrintingRepository {
  /// Generates and prints a receipt for the given [order].
  ///
  /// If [direct] is true, it will attempt to print directly to the printer
  /// without showing a system dialog.
  Future<void> printReceipt(OrderModel order, {bool direct = false});
}

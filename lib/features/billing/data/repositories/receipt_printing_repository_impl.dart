import 'package:printing/printing.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'package:intl/intl.dart';
import '../../domain/repositories/receipt_printing_repository.dart';
import '../../presentation/widgets/receipt/receipt_pdf_template.dart';

/// Implementation of [ReceiptPrintingRepository] using the `printing` package.
class ReceiptPrintingRepositoryImpl implements ReceiptPrintingRepository {
  @override
  Future<void> printReceipt(OrderModel order) async {
    final dateStr = DateFormat('dd MMM yyyy, hh:mm a').format(order.createdAt);

    // Log receipt details for verification
    _logReceiptDetails(order, dateStr);

    // Generate PDF using the presentation template
    final pdf = ReceiptPdfTemplate.build(order);

    // Print the document
    await Printing.layoutPdf(
      onLayout: (format) async => pdf.save(),
      name: 'receipt_${order.id}.pdf',
    );
  }

  /// Logs the receipt details to the console in a structured format.
  void _logReceiptDetails(OrderModel order, String dateStr) {
    // ignore: avoid_print
    print('╔════════════════════════════════════════╗');
    // ignore: avoid_print
    print('║           RMS PREMIUM DINE             ║');
    // ignore: avoid_print
    print('║      123 Culinary St, Foodie City      ║');
    // ignore: avoid_print
    print('╠════════════════════════════════════════╣');
    // ignore: avoid_print
    print('║ Order ID : ${order.id.padRight(27)}║');
    // ignore: avoid_print
    print('║ Table No : ${order.tableNumber.padRight(27)}║');
    // ignore: avoid_print
    print('║ Staff    : ${order.staffName.padRight(27)}║');
    // ignore: avoid_print
    print('║ Date     : ${dateStr.padRight(27)}║');
    // ignore: avoid_print
    print('╟────────────────────────────────────────╢');
    // ignore: avoid_print
    print(
      '║ ${"Item".padRight(20)} ${"Qty".padRight(5)} ${"Total".padLeft(11)} ║',
    );
    // ignore: avoid_print
    print('╟────────────────────────────────────────╢');

    for (var item in order.orderedMenu) {
      final itemTotal = (item.price * item.quantity).toStringAsFixed(2);
      // ignore: avoid_print
      print(
        '║ ${item.name.padRight(20)} ${item.quantity.toString().padRight(5)} ${itemTotal.padLeft(11)} ║',
      );
      if (item.selectedPortion != null) {
        // ignore: avoid_print
        print('║   (${item.selectedPortion!.name.padRight(35)}) ║');
      }
    }

    // ignore: avoid_print
    print('╟────────────────────────────────────────╢');
    // ignore: avoid_print
    print(
      '║ SUBTOTAL   : ${order.totalAmount.toStringAsFixed(2).padLeft(25)} ║',
    );
    // ignore: avoid_print
    print('╠════════════════════════════════════════╣');
    // ignore: avoid_print
    print(
      '║ TOTAL      : ${order.totalAmount.toStringAsFixed(2).padLeft(25)} ║',
    );
    // ignore: avoid_print
    print('╠════════════════════════════════════════╣');
    // ignore: avoid_print
    print('║      THANK YOU FOR DINING WITH US!     ║');
    // ignore: avoid_print
    print('║          VISIT US AGAIN SOON!          ║');
    // ignore: avoid_print
    print('╚════════════════════════════════════════╝');
  }
}

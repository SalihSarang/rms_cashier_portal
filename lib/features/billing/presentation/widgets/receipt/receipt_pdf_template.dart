import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:rms_shared_package/rms_shared_package.dart';
import 'components/receipt_header.dart';
import 'components/receipt_order_info.dart';
import 'components/receipt_items_table.dart';
import 'components/receipt_summary.dart';
import 'components/receipt_footer.dart';

/// Helper class to generate the PDF layout for receipts.
///
/// This is placed in the presentation layer as it handles the visual
/// representation of the order on paper.
class ReceiptPdfTemplate {
  /// Builds a [pw.Document] for the given [order].
  static pw.Document build(OrderModel order, {RestaurantModel? restaurant}) {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.roll80,
        margin: const pw.EdgeInsets.all(12),
        build: (pw.Context context) {
          final subTotal = order.totalAmount;
          final cgstRate = restaurant?.cgstRate ?? 2.5;
          final sgstRate = restaurant?.sgstRate ?? 2.5;
          final cgst = subTotal * (cgstRate / 100);
          final sgst = subTotal * (sgstRate / 100);
          final grandTotal = subTotal + cgst + sgst;

          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              ReceiptHeader(restaurant: restaurant),
              ReceiptOrderInfo(order: order),
              ReceiptItemsTable(items: order.orderedMenu),
              ReceiptSummary(
                subTotal: subTotal,
                cgst: cgst,
                sgst: sgst,
                grandTotal: grandTotal,
                cgstRate: cgstRate,
                sgstRate: sgstRate,
              ),
              ReceiptFooter(),
            ],
          );
        },
      ),
    );

    return pdf;
  }
}

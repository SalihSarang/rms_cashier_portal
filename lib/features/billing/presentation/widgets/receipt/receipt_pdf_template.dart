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
  static pw.Document build(OrderModel order) {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.roll80,
        margin: const pw.EdgeInsets.all(12),
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              ReceiptHeader(),
              ReceiptOrderInfo(order: order),
              ReceiptItemsTable(items: order.orderedMenu),
              ReceiptSummary(totalAmount: order.totalAmount),
              ReceiptFooter(),
            ],
          );
        },
      ),
    );

    return pdf;
  }
}

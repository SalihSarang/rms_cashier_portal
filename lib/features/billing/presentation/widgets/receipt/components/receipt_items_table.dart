import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:rms_shared_package/rms_shared_package.dart';

/// Component for the itemized list section.
class ReceiptItemsTable extends pw.StatelessWidget {
  final List<CartItemModel> items;

  ReceiptItemsTable({required this.items});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      children: [
        pw.SizedBox(height: 10),
        pw.Divider(thickness: 1, color: PdfColors.grey300),
        pw.SizedBox(height: 5),
        pw.Table(
          columnWidths: {
            0: const pw.FlexColumnWidth(3),
            1: const pw.FlexColumnWidth(1),
            2: const pw.FlexColumnWidth(1),
          },
          children: [
            // Table Header
            pw.TableRow(
              children: [
                pw.Text(
                  'DESCRIPTION',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 8,
                  ),
                ),
                pw.Text(
                  'QTY',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 8,
                  ),
                  textAlign: pw.TextAlign.center,
                ),
                pw.Text(
                  'TOTAL',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 8,
                  ),
                  textAlign: pw.TextAlign.right,
                ),
              ],
            ),
            pw.TableRow(
              children: [pw.SizedBox(height: 5), pw.SizedBox(), pw.SizedBox()],
            ),
            // Items
            ...items.map((item) {
              return pw.TableRow(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.symmetric(vertical: 2),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          item.name,
                          style: const pw.TextStyle(fontSize: 9),
                        ),
                        if (item.selectedPortion != null)
                          pw.Text(
                            '(${item.selectedPortion!.name})',
                            style: pw.TextStyle(
                              fontSize: 7,
                              color: PdfColors.grey700,
                            ),
                          ),
                      ],
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.symmetric(vertical: 2),
                    child: pw.Text(
                      item.quantity.toString(),
                      style: const pw.TextStyle(fontSize: 9),
                      textAlign: pw.TextAlign.center,
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.symmetric(vertical: 2),
                    child: pw.Text(
                      (item.price * item.quantity).toStringAsFixed(2),
                      style: const pw.TextStyle(fontSize: 9),
                      textAlign: pw.TextAlign.right,
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ],
    );
  }
}

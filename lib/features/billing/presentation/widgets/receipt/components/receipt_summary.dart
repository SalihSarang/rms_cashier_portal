import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

/// Component for the financial summary (Subtotal and Total).
class ReceiptSummary extends pw.StatelessWidget {
  final double totalAmount;

  ReceiptSummary({required this.totalAmount});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      children: [
        pw.SizedBox(height: 10),
        pw.Divider(thickness: 1, color: PdfColors.grey300),
        pw.SizedBox(height: 5),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(
              'SUBTOTAL',
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                fontSize: 10,
              ),
            ),
            pw.Text(
              totalAmount.toStringAsFixed(2),
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ],
        ),
        pw.SizedBox(height: 5),
        pw.Divider(thickness: 1.5, color: PdfColors.black),
        pw.SizedBox(height: 5),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(
              'TOTAL PAYABLE',
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                fontSize: 12,
              ),
            ),
            pw.Text(
              totalAmount.toStringAsFixed(2),
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

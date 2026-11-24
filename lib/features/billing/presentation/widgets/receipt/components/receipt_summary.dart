import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

/// Component for the financial summary (Subtotal, CGST, SGST, and Total Payable).
class ReceiptSummary extends pw.StatelessWidget {
  final double subTotal;
  final double cgst;
  final double sgst;
  final double grandTotal;
  final double cgstRate;
  final double sgstRate;

  ReceiptSummary({
    required this.subTotal,
    required this.cgst,
    required this.sgst,
    required this.grandTotal,
    this.cgstRate = 2.5,
    this.sgstRate = 2.5,
  });

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      children: [
        pw.SizedBox(height: 8),
        pw.Divider(thickness: 1, color: PdfColors.grey300),
        pw.SizedBox(height: 4),
        _buildRow('SUBTOTAL', subTotal.toStringAsFixed(2)),
        if (cgst > 0)
          _buildRow(
            'CGST (${cgstRate.toStringAsFixed(1)}%)',
            cgst.toStringAsFixed(2),
          ),
        if (sgst > 0)
          _buildRow(
            'SGST (${sgstRate.toStringAsFixed(1)}%)',
            sgst.toStringAsFixed(2),
          ),
        pw.SizedBox(height: 4),
        pw.Divider(thickness: 1.5, color: PdfColors.black),
        pw.SizedBox(height: 4),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(
              'TOTAL PAYABLE',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 11),
            ),
            pw.Text(
              'INR ${grandTotal.toStringAsFixed(2)}',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 11),
            ),
          ],
        ),
      ],
    );
  }

  pw.Widget _buildRow(String label, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 1.5),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(label, style: const pw.TextStyle(fontSize: 9)),
          pw.Text(value, style: const pw.TextStyle(fontSize: 9)),
        ],
      ),
    );
  }
}

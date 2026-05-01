import 'package:pdf/widgets.dart' as pw;

/// Component for the receipt footer section.
class ReceiptFooter extends pw.StatelessWidget {
  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      children: [
        pw.SizedBox(height: 20),
        pw.Text(
          'Thank you for dining with us!',
          style: pw.TextStyle(
            fontStyle: pw.FontStyle.italic,
            fontSize: 9,
          ),
        ),
        pw.Text(
          'Visit us again soon!',
          style: pw.TextStyle(
            fontStyle: pw.FontStyle.italic,
            fontSize: 9,
          ),
        ),
        pw.SizedBox(height: 10),
      ],
    );
  }
}

import 'package:pdf/widgets.dart' as pw;

/// Component for the restaurant branding section.
class ReceiptHeader extends pw.StatelessWidget {
  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      children: [
        pw.Text(
          'RMS PREMIUM DINE',
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 18),
        ),
        pw.SizedBox(height: 2),
        pw.Text(
          '123 Culinary Street, Foodie City',
          style: const pw.TextStyle(fontSize: 8),
        ),
        pw.Text('Tel: +1 234 567 890', style: const pw.TextStyle(fontSize: 8)),
        pw.SizedBox(height: 8),
      ],
    );
  }
}

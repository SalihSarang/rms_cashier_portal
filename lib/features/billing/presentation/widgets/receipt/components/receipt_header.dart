import 'package:pdf/widgets.dart' as pw;
import 'package:rms_shared_package/rms_shared_package.dart';

/// Component for the restaurant branding section.
class ReceiptHeader extends pw.StatelessWidget {
  final RestaurantModel? restaurant;

  ReceiptHeader({this.restaurant});

  @override
  pw.Widget build(pw.Context context) {
    final name = (restaurant?.name.isNotEmpty ?? false)
        ? restaurant!.name
        : 'RMS PREMIUM DINE';
    final address = (restaurant?.address.isNotEmpty ?? false)
        ? restaurant!.address
        : '123 Culinary Street, Foodie City';
    final phone = (restaurant?.phone.isNotEmpty ?? false)
        ? 'Tel: ${restaurant!.phone}'
        : 'Tel: +1 234 567 890';
    final gstin = (restaurant?.gstin.isNotEmpty ?? false)
        ? 'GSTIN: ${restaurant!.gstin}'
        : null;
    final fssai = (restaurant?.fssaiNumber.isNotEmpty ?? false)
        ? 'FSSAI: ${restaurant!.fssaiNumber}'
        : null;

    return pw.Column(
      children: [
        pw.Text(
          name,
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 16),
          textAlign: pw.TextAlign.center,
        ),
        pw.SizedBox(height: 2),
        if (address.isNotEmpty)
          pw.Text(
            address,
            style: const pw.TextStyle(fontSize: 8),
            textAlign: pw.TextAlign.center,
          ),
        pw.Text(phone, style: const pw.TextStyle(fontSize: 8)),
        if (gstin != null)
          pw.Text(gstin, style: const pw.TextStyle(fontSize: 7)),
        if (fssai != null)
          pw.Text(fssai, style: const pw.TextStyle(fontSize: 7)),
        pw.SizedBox(height: 8),
      ],
    );
  }
}

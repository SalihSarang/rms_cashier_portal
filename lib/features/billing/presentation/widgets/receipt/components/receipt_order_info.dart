import 'package:pdf/widgets.dart' as pw;
import 'package:rms_shared_package/rms_shared_package.dart';
import 'package:intl/intl.dart';

/// Component for the order metadata section.
class ReceiptOrderInfo extends pw.StatelessWidget {
  final OrderModel order;

  ReceiptOrderInfo({required this.order});

  @override
  pw.Widget build(pw.Context context) {
    final dateStr = DateFormat('dd MMM yyyy, hh:mm a').format(order.createdAt);

    return pw.Column(
      children: [
        pw.Text(
          '--- RECEIPT ---',
          style: pw.TextStyle(
            fontWeight: pw.FontWeight.bold,
            fontSize: 10,
          ),
        ),
        pw.SizedBox(height: 8),
        pw.Container(
          alignment: pw.Alignment.centerLeft,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    'Order ID: #${order.id.substring(order.id.length - 6).toUpperCase()}',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 9,
                    ),
                  ),
                  pw.Text(
                    'Table: ${order.tableNumber}',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 9,
                    ),
                  ),
                ],
              ),
              pw.Text(
                'Staff: ${order.staffName}',
                style: const pw.TextStyle(fontSize: 8),
              ),
              pw.Text(
                'Date: $dateStr',
                style: const pw.TextStyle(fontSize: 8),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

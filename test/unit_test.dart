import 'package:flutter_test/flutter_test.dart';
import 'package:cashier_portal/features/billing/presentation/utils/billing_utils.dart';

void main() {
  group('BillingUtils Tests', () {
    test('formatTime should format AM correctly', () {
      final time = DateTime(2023, 1, 1, 9, 5);
      expect(BillingUtils.formatTime(time), '09:05 AM');
    });

    test('formatTime should format PM correctly', () {
      final time = DateTime(2023, 1, 1, 21, 45);
      expect(BillingUtils.formatTime(time), '09:45 PM');
    });

    test('formatTime should handle midnight correctly', () {
      final time = DateTime(2023, 1, 1, 0, 0);
      expect(BillingUtils.formatTime(time), '12:00 AM');
    });

    test('formatTime should handle noon correctly', () {
      final time = DateTime(2023, 1, 1, 12, 0);
      expect(BillingUtils.formatTime(time), '12:00 PM');
    });
  });
}

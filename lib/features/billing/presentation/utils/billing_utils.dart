class BillingUtils {
  /// Formats a DateTime into a 12-hour string format (e.g., 1:05 PM).
  static String formatTime(DateTime time) {
    final int h = time.hour % 12 == 0 ? 12 : time.hour % 12;
    final String hour = h.toString().padLeft(2, '0');
    final String minute = time.minute.toString().padLeft(2, '0');
    final String period = time.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }
}



class BillingQueueUtils {
  static String getTimeAgo(DateTime createdAt) {
    final Duration diff = DateTime.now().difference(createdAt);
    return '${diff.inMinutes}m ago';
  }

  static ({String name, String area}) getTableDetails(String tableNumber) {
    String name = 'Table $tableNumber';
    String area = '';
    
    if (tableNumber.contains('(')) {
      final parts = tableNumber.split(' (');
      name = 'Table ${parts[0]}';
      area = '(${parts[1]}';
    }
    
    return (name: name, area: area);
  }
}

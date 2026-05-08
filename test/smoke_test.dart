import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Smoke test: Verify environment and basic rendering', (WidgetTester tester) async {
    // Build a simple widget to verify the test framework works
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Text('Smoke Test'),
        ),
      ),
    );

    expect(find.text('Smoke Test'), findsOneWidget);
    expect(find.text('Non-existent text'), findsNothing);
  });
}

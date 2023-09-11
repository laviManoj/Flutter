import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflitetask/main.dart';
void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build the widget tree.
    await tester.pumpWidget(const MaterialApp(home: Splash()));
    // Verify that our counter starts at 0.
    expect(find.text('0'), findsNothing); // Initial value of the counter
    expect(find.text('1'), findsNothing); // No '1' present initially
    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump(); // Rebuild the widget after the tap
    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing); // No '0' should be present now
    expect(find.text('1'), findsOneWidget); // '1' should be present after increment
  });
}

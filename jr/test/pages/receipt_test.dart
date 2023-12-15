import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jr/pages/receipt.dart'; // Replace with the actual path to your MyForm file

void main() {
  testWidgets('Name field validation', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: ReceiptPage()));

    // Enter an empty name in the name field.
    await tester.enterText(find.byKey(const Key('receipt')), '');

    await tester.pump();

    // Expect to find an error message.
    expect(find.text('{name}'), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jr/pages/booking_page.dart'; // Replace with the actual path to your MyForm file

void main() {
  testWidgets('Name field validation', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: MyForm()));

    // Enter an empty name in the name field.
    await tester.enterText(find.byKey(const Key('name')), '');

    // Trigger a form validation by tapping the button or any other action.

    await tester.tap(find.byKey(const Key('booking')));

    // Rebuild the widget after the state has changed.
    await tester.pump();

    // Expect to find an error message.
    expect(find.text('Please enter a name'), findsOneWidget);
  });
}

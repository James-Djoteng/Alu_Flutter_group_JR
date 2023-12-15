import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jr/pages/booking_page.dart';

void main() {
  test('adds two numbers together', () {
    const int a = 1;
    const int b = 2;
    int sum = add(a, b);

    expect(sum, equals(3));
  });
  testWidgets('Name field validation', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
        home: MyForm())); // Assuming MyForm is the class containing _buildName

    // Enter an empty name in the name field.
    await tester.enterText(find.byKey(const Key('name')), '');

    // Trigger a form validation by tapping the button or any other action.
    // Replace 'your_button_key' with the actual key of the button you want to tap.
    await tester.tap(find.byKey(const Key('booking')));

    // Rebuild the widget after the state has changed.
    await tester.pump();

    // Expect to find an error message.
    expect(find.text('Please enter a name'), findsOneWidget);
  });
}

int add(int a, int b) {
  return a + b;
}
// Replace with the actual path to your MyForm file



  
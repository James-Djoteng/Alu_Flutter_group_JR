import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jr/main.dart'; // Import the main.dart file or adjust the import as needed.

void main() {
  testWidgets('Test "Book a trip" button', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
        MyApp()); // Replace MyApp with the appropriate widget from your app.

    // Find the "Book a trip Now" button.
    final bookATripButton = find.text('Book a trip Now');

    // Tap the "Book a trip Now" button.
    await tester.tap(bookATripButton);

    // Rebuild the widget after the state has changed.
    await tester.pump();

    // Verify that the booking screen is pushed to the navigation stack.
    expect(find.byKey(const Key('booking_screen')), findsOneWidget);
  });
}

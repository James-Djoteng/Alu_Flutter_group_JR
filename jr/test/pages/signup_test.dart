import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jr/main.dart';
import 'package:jr/pages/signup.dart';

void main() {
  testWidgets('Checking the text of our Signup page',
      (WidgetTester tester) async {
    // TODO: Implement test

    await tester.pumpWidget(
      const MyApp(),
    );
    await tester.pump();
    expect(find.text('Sign up'), findsOneWidget);
  });
  testWidgets('testing our user login form', (WidgetTester tester) async {
    // TODO: Implement test

    await tester.pumpWidget(const MaterialApp(
      home: SingupPage(),
    ));
    await tester.pump();

    await tester.pumpAndSettle();
    expect(find.byKey(const Key('email')), findsOneWidget);
  });
}

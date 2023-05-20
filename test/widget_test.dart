import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/main.dart';
import 'package:app/splash_screen.dart';

void main() {
  testWidgets('Login test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: MyApp()));

    // Verify that we are on the splash screen.
    expect(find.byType(SplashScreen), findsOneWidget);

    // Wait for splash screen to finish.
    await tester.pumpAndSettle();

    // Verify that we are on the login page.
    expect(find.text('Login'), findsOneWidget);

    // Enter the correct email and password.
    await tester.enterText(find.byType(TextFormField).at(0), 'user');
    await tester.enterText(find.byType(TextFormField).at(1), 'pw');

    // Tap the login button and trigger a frame.
    await tester.tap(find.text('Login'));
    await tester.pump();

    // Verify that we are on the main page.
    expect(find.text('Main Page'), findsOneWidget);
    expect(find.text('Welcome'), findsOneWidget);
  });
}

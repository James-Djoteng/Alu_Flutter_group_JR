import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jr/pages/receipt.dart';
import 'pages/homepage.dart';
import 'pages/booking_page.dart';
import './pages/login_page.dart';
import './pages/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyC0HRzjvwK690JvIDHULmEsZ0rzemdwIbM",
    projectId: "tirana-f1d9c",
    messagingSenderId: "627611705374",
    appId: "1:627611705374:web:c138a93ed2c971bbd5ce0f",
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tirana',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(
              title: 'Tirana',
            ),
        'homePage': (context) => const MyHomePage(title: 'Tirana'),
        'signUp': (context) => const SingupPage(),
        'login': (context) => const LoginPage(),
        'booking': (context) => const MyForm(),
        'Receipt': (context) => const ReceiptPage()
      },
    );
  }
}

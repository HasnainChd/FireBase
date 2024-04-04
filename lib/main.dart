import 'package:firebase_week6/Screens/login_screen.dart';
import 'package:firebase_week6/Screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyB6kFcZvyM7I7BDo3wHkebTOcZh-h2KlXI',
          appId: '1:56323839801:android:307d80793e5618aa287ae8',
          messagingSenderId: '56323839801',
          projectId: 'fir-1-7ade3'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.black),
        primaryColor: Colors.blue, // Set your default color here
      ),
      home: const LoginPage(),
    );
  }
}

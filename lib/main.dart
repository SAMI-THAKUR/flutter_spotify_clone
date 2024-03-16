import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './components/AUTH/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // ignore: prefer_const_constructors
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotify Clone',
      theme: ThemeData(
        fontFamily: 'Proxima Nova',
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        hintColor: Colors.cyan[600],
      ),
      home: const SplashScreen(),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/logic/auth_logic.dart';
import '../tabbar.dart';
import './auth_ui.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future onloadDecider() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Material(
                    child: ChangeNotifierProvider(
                      create: (_) => SessionManagement(),
                      child: const FirebaseSession(),
                    ),
                  )));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Material(
                    child: MultiProvider(
                      providers: [
                        ChangeNotifierProvider(
                          create: (_) => SessionManagement(),
                        ),
                      ],
                      child: const Tabbar(),
                    ),
                  )));
    }
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      onloadDecider();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset("./images/spotify_logo_title.png"),
    );
  }
}

class FirebaseSession extends StatelessWidget {
  const FirebaseSession({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 0, 254, 100),
              Color.fromRGBO(51, 51, 153, 100),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: const AuthUI(),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'AUTH/auth.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await _signOut(context);
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}

Future<void> _signOut(BuildContext context) async {
  try {
    // Sign out from Firebase Authentication
    await FirebaseAuth.instance.signOut();

    // Navigate back to the login page or any other page you desire
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SplashScreen()));
  } catch (e) {
    // Handle any errors that occur during logout
    print('Error signing out: $e');
    // You can show a snackbar or display an error message to the user
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Error signing out. Please try again.'),
    ));
  }
}

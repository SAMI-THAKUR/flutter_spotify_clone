import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify_final/components/AUTH/auth.dart';
import 'package:spotify_final/main.dart';

// ignore: use_key_in_widget_constructors
class Setting extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("users")
          .doc(_auth.currentUser?.uid)
          .snapshots(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (!snapshot.hasData || snapshot.data!.data() == null) {
          // User document not found
          return const Text("User not found");
        } else {
          // User document found
          Map<String, dynamic> userData =
              snapshot.data!.data() as Map<String, dynamic>;

          // Access the user's name
          String userName = userData["name"] ?? "No name";
          String userEmail = userData["email"] ?? "No email";
          bool premium = userData["premiumMember"] ?? false;
          String nameIndex = userData["nameIndex"] ?? "No";

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 40),
                CircleAvatar(
                  radius: 70,
                  child: Text(
                    nameIndex,
                    style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                itemProfile(userName, CupertinoIcons.person),
                const SizedBox(height: 10),
                itemProfile(userEmail, CupertinoIcons.mail),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _signOut(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ), // Text color
                    ),
                    child: const Text(
                      'Sign Out',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }

  itemProfile(String title, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color: Colors.deepOrange.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title,
            style: GoogleFonts.ibmPlexMono(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            )),
        leading: Icon(iconData, color: Colors.black, size: 20),
      ),
    );
  }
}
// Remove the incomplete code block

Future<void> _signOut(BuildContext context) async {
  try {
    // Sign out from Firebase Authentication
    await FirebaseAuth.instance.signOut();

    // Navigate back to the login page or any other page you desire
    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (context) => const MyApp()),
    );
  } catch (e) {
    // Handle any errors that occur during logout
    // You can show a snackbar or display an error message to the user
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Error signing out. Please try again.'),
    ));
  }
}

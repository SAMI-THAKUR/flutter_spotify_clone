import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile extends StatelessWidget {
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
          return CircularProgressIndicator();
        } else if (!snapshot.hasData || snapshot.data!.data() == null) {
          // User document not found
          return Text("User not found");
        } else {
          // User document found
          Map<String, dynamic> userData =
              snapshot.data!.data() as Map<String, dynamic>;

          // Access the user's name
          String userName = userData["name"] ?? "No name";

          return Text(
            "Welcome, $userName",
            style: GoogleFonts.baloo2(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }
      },
    );
  }
}

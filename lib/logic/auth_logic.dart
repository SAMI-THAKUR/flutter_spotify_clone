// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/tabbar.dart';
import '/logic/basic_ui.dart';

class SessionManagement extends ChangeNotifier {
  late User fUser;

  Future<User?> currentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
    } else {
      return user;
    }
    return null;
  }

  Future<bool> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }
}

class LoginLogic extends ChangeNotifier {
  bool loginButton = false;
  bool showPassword = false;
  bool isAuthenticating = false;

  late String email, password;

  void showPassFun() {
    showPassword = !showPassword;
    notifyListeners();
  }

  void loginButtonListener(String username, String password) {
    if (username.length > 5 && password.length > 5) {
      loginButton = true;
      notifyListeners();
    } else {
      loginButton = false;
      notifyListeners();
    }
  }

  void loginIn(BuildContext context, String email, String pass) async {
    isAuthenticating = true;
    notifyListeners();
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      isAuthenticating = false;
      notifyListeners();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => MultiProvider(
                    providers: [
                      ChangeNotifierProvider(
                        create: (_) => SessionManagement(),
                      )
                    ],
                    child: const Tabbar(),
                  )),
          (Route<dynamic> route) => false);
    } catch (e) {
      final ShowCustomAlertDialog showCustomAlertDialog =
          ShowCustomAlertDialog();
      showCustomAlertDialog.showCustomDialog(context, e.toString());
      isAuthenticating = false;
      loginButton = false;
      notifyListeners();
    }
  }
}

class CreateUserAccount extends ChangeNotifier {
  final PageController pctrl = PageController(initialPage: 0);
  bool emailNextEnabled = false;
  bool passNextEnabled = false;
  bool nameNextEnabled = false;

  bool isCreatingAccount = false;

  bool showPassword = false;
  late String name, email, password;

  void emailNextButtonListener(String text) {
    if (text.length > 5) {
      emailNextEnabled = true;
    } else {
      emailNextEnabled = false;
    }
    notifyListeners();
  }

  void passNextButtonListener(String text) {
    if (text.length > 6) {
      passNextEnabled = true;
    } else {
      passNextEnabled = false;
    }
    notifyListeners();
  }

  void nameNextButtonListener(String text) {
    if (text.length > 6) {
      nameNextEnabled = true;
    } else {
      nameNextEnabled = false;
    }
    notifyListeners();
  }

  void showPassFun() {
    showPassword = !showPassword;
    notifyListeners();
  }

  Future<bool> signUp(
      BuildContext context, String name, String email, String password) async {
    isCreatingAccount = true;
    notifyListeners();
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userCredential.user?.uid)
          .set({
        "name": name,
        "nameIndex": name[0],
        "premiumMember": false,
        "email": email,
        "uid": userCredential.user!.uid
      });
      isCreatingAccount = false;
      notifyListeners();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => MultiProvider(
                    providers: [
                      ChangeNotifierProvider(
                        create: (_) => SessionManagement(),
                      )
                    ],
                    child: const Tabbar(),
                  )),
          (Route<dynamic> route) => false);
      return true;
    } catch (e) {
      final ShowCustomAlertDialog showCustomAlertDialog =
          ShowCustomAlertDialog();
      isCreatingAccount = false;
      notifyListeners();
      showCustomAlertDialog.showCustomDialog(context, e.toString());
      return false;
    }
  }
}

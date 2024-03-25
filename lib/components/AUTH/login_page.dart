import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_final/logic/auth_logic.dart';
import 'package:spotify_final/logic/basic_ui.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final loginLogic = Provider.of<LoginLogic>(context);
    final uiComponents = Provider.of<ShowCustomAlertDialog>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Email or Username",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              autofocus: false,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[800],
                contentPadding: const EdgeInsets.all(16.0),
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[800]!),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (text) {
                loginLogic.email = text;
                loginLogic.loginButtonListener(
                    loginLogic.email, loginLogic.password);
              },
            ),
            const SizedBox(height: 20.0),
            const Text(
              "Password",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              obscureText: !loginLogic.showPassword,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[800],
                contentPadding: const EdgeInsets.all(16.0),
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[800]!),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    loginLogic.showPassFun();
                  },
                  icon: Icon(
                    loginLogic.showPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.white,
                  ),
                ),
              ),
              onChanged: (text) {
                loginLogic.password = text;
                loginLogic.loginButtonListener(
                    loginLogic.email, loginLogic.password);
              },
            ),
            const SizedBox(height: 20.0),
            Center(
              child: loginLogic.isAuthenticating
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();

                        if (loginLogic.loginButton) {
                          loginLogic.loginIn(
                              context, loginLogic.email, loginLogic.password);
                        } else {
                          uiComponents.showCustomDialog(
                              context, "Enter your Email and Password");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60.0, vertical: 15.0),
                        backgroundColor:
                            loginLogic.loginButton ? Colors.white : Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Text(
                        "LOG IN",
                        style: TextStyle(
                          color: loginLogic.loginButton
                              ? Colors.green
                              : Colors.black,
                          fontSize: 18.0,
                          fontFamily: 'Proxima Nova Bold',
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

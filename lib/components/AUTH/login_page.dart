import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_final/logic/auth_logic.dart';
import 'package:spotify_final/logic/basic_ui.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Email or userame",
              style: TextStyle(
                fontSize: 30.0,
                fontFamily: 'Proxima Nova Bold',
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            TextFormField(
              autofocus: false,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(16.0),
                fillColor: Colors.grey,
                filled: true,
                border: OutlineInputBorder(),
              ),
              onChanged: (String text) {
                loginLogic.email = text;
                loginLogic.loginButtonListener(
                    loginLogic.email, loginLogic.password);
              },
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              "Password",
              style: TextStyle(
                fontSize: 30.0,
                fontFamily: 'Proxima Nova Bold',
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            TextFormField(
              obscureText: !loginLogic.showPassword,
              autofocus: false,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(16.0),
                  fillColor: Colors.grey,
                  filled: true,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      loginLogic.showPassFun();
                    },
                    icon: loginLogic.showPassword
                        ? const Icon(
                            Icons.visibility,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.visibility_off,
                            color: Colors.white,
                          ),
                  )),
              onChanged: (String text) {
                loginLogic.password = text;
                loginLogic.loginButtonListener(
                    loginLogic.email, loginLogic.password);
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: loginLogic.isAuthenticating
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();

                        if (loginLogic.loginButton) {
                          // Perform login when conditions are met
                          loginLogic.loginIn(
                              context, loginLogic.email, loginLogic.password);
                        } else {
                          // Show a custom dialog if loginButton is false
                          uiComponents.showCustomDialog(
                              context, "Enter your Email and Password");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding:
                            const EdgeInsets.fromLTRB(45.0, 15.0, 45.0, 15.0),
                        backgroundColor:
                            loginLogic.loginButton ? Colors.white : Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                      child: const Text(
                        "LOG IN",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: 'Proxima Nova Bold',
                        ),
                      ),
                    ),
            ),
            const SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}

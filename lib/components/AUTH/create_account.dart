import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/logic/auth_logic.dart';
import '/logic/basic_ui.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final sessionObj = Provider.of<CreateUserAccount>(context);
    final uiComponents = Provider.of<ShowCustomAlertDialog>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: const Text(
          "Create account",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: PageView(
        controller: sessionObj.pctrl,
        physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "What's your email?",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Proxima Nova Bold',
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  autofocus: false,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(16.0),
                      fillColor: Colors.grey,
                      filled: true,
                      border: OutlineInputBorder()),
                  onChanged: (String text) {
                    sessionObj.emailNextButtonListener(text);
                    sessionObj.email = text;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();

                      if (sessionObj.emailNextEnabled) {
                        // Navigate to the next page with a smooth animation
                        sessionObj.pctrl.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      } else {
                        // Show a custom dialog if emailNextEnabled is false
                        uiComponents.showCustomDialog(
                            context, "Please Enter your Email");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                          const EdgeInsets.fromLTRB(45.0, 15.0, 45.0, 15.0),
                      backgroundColor: sessionObj.emailNextEnabled
                          ? Colors.white
                          : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                    child: const Text(
                      "NEXT",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontFamily: 'Proxima Nova Bold',
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Create a Password",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Proxima Nova Bold',
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  obscureText: !sessionObj.showPassword,
                  autofocus: false,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16.0),
                      fillColor: Colors.grey,
                      filled: true,
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          sessionObj.showPassFun();
                        },
                        icon: sessionObj.showPassword
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
                    sessionObj.passNextButtonListener(text);
                    sessionObj.password = text;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();

                      if (sessionObj.passNextEnabled) {
                        // Navigate to the next page with a smooth animation
                        sessionObj.pctrl.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      } else {
                        // Show a custom dialog if passNextEnabled is false
                        uiComponents.showCustomDialog(
                            context, "Password must be at least 8 characters");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                          const EdgeInsets.fromLTRB(45.0, 15.0, 45.0, 15.0),
                      backgroundColor: sessionObj.passNextEnabled
                          ? Colors.white
                          : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                    child: const Text(
                      "NEXT",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontFamily: 'Proxima Nova Bold',
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "What's your name?",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Proxima Nova Bold',
                  ),
                ),
                const SizedBox(
                  height: 10.0,
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
                    sessionObj.nameNextButtonListener(text);
                    sessionObj.name = text;
                  },
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 10.0, 5.0, 5.0),
                  child: Text("This appears on your Spotify profile."),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: sessionObj.isCreatingAccount
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();

                            if (sessionObj.nameNextEnabled) {
                              // Perform sign-up when conditions are met
                              sessionObj.signUp(
                                context,
                                sessionObj.name,
                                sessionObj.email,
                                sessionObj.password,
                              );
                            } else {
                              // Show a custom dialog if nameNextEnabled is false
                              uiComponents.showCustomDialog(context,
                                  "Name should be at least 6 characters");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(
                                45.0, 15.0, 45.0, 15.0),
                            backgroundColor: sessionObj.nameNextEnabled
                                ? Colors.white
                                : Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                          ),
                          child: const Text(
                            "Create",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontFamily: 'Proxima Nova Bold',
                            ),
                          ),
                        ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "By creating an account, you agree to Spotify's Terms of Service.",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "To learn more about how Spotify collects, uses, shares and protects your personal data please read Spotify's Privacy Policy",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

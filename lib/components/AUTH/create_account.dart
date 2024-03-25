import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      backgroundColor: Colors.black45,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.black45,
        title: Text(
          "Create account",
          style: GoogleFonts.anonymousPro(
            textStyle: const TextStyle(fontSize: 25),
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
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "What's your email?",
                  style: GoogleFonts.ibmPlexMono(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(16.0),
                    fillColor: Colors.grey[200], // Input field color
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "Email",
                    hintStyle:
                        TextStyle(color: Colors.grey[500]), // Hint text color
                  ),
                  style:
                      const TextStyle(color: Colors.black), // Input text color
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 16.0),
                      backgroundColor: sessionObj.emailNextEnabled
                          ? Colors.green
                          : Colors.grey.withOpacity(0.6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      elevation: 4.0,
                    ),
                    child: const Text(
                      "NEXT",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
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
                Text(
                  "Password",
                  style: GoogleFonts.ibmPlexMono(
                    textStyle: const TextStyle(fontSize: 20),
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
                    fillColor: Colors.grey[200], // Input field color
                    filled: true,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    hintText: "Password",
                    hintStyle:
                        TextStyle(color: Colors.grey[500]), // Hint text color
                    suffixIcon: IconButton(
                      onPressed: () {
                        sessionObj.showPassFun();
                      },
                      icon: Icon(
                        sessionObj.showPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey[500], // Icon color
                      ),
                    ),
                  ),
                  style:
                      const TextStyle(color: Colors.black), // Input text color
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
                    padding: const EdgeInsets.fromLTRB(45.0, 15.0, 45.0, 15.0),
                    backgroundColor: sessionObj.passNextEnabled
                        ? Colors.black
                        : Colors.grey[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                  child: Text(
                    "NEXT",
                    style: TextStyle(
                      color: sessionObj.passNextEnabled
                          ? Colors.white
                          : Colors.green,
                      fontSize: 18.0,
                      fontFamily: 'Proxima Nova Bold',
                    ),
                  ),
                ))
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
                Text(
                  "What should we call you?",
                  style: GoogleFonts.ibmPlexMono(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(16.0),
                    fillColor: Colors.grey[200], // Adjusted input field color
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Name",
                    hintStyle: TextStyle(
                        color: Colors.grey[500]), // Adjusted hint text color
                  ),
                  style: const TextStyle(
                      color: Colors.black), // Adjusted input text color
                  onChanged: (String text) {
                    sessionObj.nameNextButtonListener(text);
                    sessionObj.name = text;
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 5.0, 5.0),
                      child: Text(
                        "This appears on your Spotify profile.",
                        style: TextStyle(
                          color: Colors.grey[600], // Adjusted text color
                          fontSize: 16.0, // Adjusted font size
                          fontFamily:
                              'Proxima Nova Regular', // Adjusted font family
                        ),
                      ),
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
                                  uiComponents.showCustomDialog(
                                    context,
                                    "Name should be at least 6 characters",
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.fromLTRB(
                                    45.0, 15.0, 45.0, 15.0),
                                backgroundColor: sessionObj.nameNextEnabled
                                    ? Colors.green
                                    : Colors.blueGrey, // Adjusted button color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                              ),
                              child: const Text(
                                "Create",
                                style: TextStyle(
                                  color: Colors.white, // Adjusted text color
                                  fontSize: 18.0,
                                  fontFamily: 'Proxima Nova Bold',
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          "By creating an account, you agree to Spotify's Terms of Service.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey[600], // Adjusted text color
                            fontSize: 16.0, // Adjusted font size
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          "To learn more about how Spotify collects, uses, shares and protects your personal data please read Spotify's Privacy Policy",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey[600], // Adjusted text color
                            fontSize: 16.0, // Adjusted font size
                          ),
                        ),
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

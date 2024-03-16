import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_final/components/AUTH/login_page.dart';
import '/logic/auth_logic.dart';
import '/logic/basic_ui.dart';
import 'create_account.dart';

class SignupOrLogin extends StatelessWidget {
  const SignupOrLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color.fromRGBO(255, 0, 254, 100),
          Color.fromRGBO(51, 51, 153, 100),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Email",
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Proxima Nova Bold',
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Material(
                                child: MultiProvider(
                                  providers: [
                                    ChangeNotifierProvider(
                                      create: (_) => CreateUserAccount(),
                                    ),
                                    ChangeNotifierProvider(
                                      create: (_) => ShowCustomAlertDialog(),
                                    ),
                                  ],
                                  child: const CreateAccount(),
                                ),
                              )));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 300.0,
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: const Text(
                    "SIGN UP FREE",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      color: Colors.grey,
                      height: 2.0,
                      width: MediaQuery.of(context).size.width * 0.35,
                    ),
                    const Text(
                      "OR",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.grey,
                      height: 2.0,
                      width: MediaQuery.of(context).size.width * 0.35,
                    )
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Material(
                                child: MultiProvider(
                                  providers: [
                                    ChangeNotifierProvider(
                                      create: (_) => LoginLogic(),
                                    ),
                                    ChangeNotifierProvider(
                                      create: (_) => ShowCustomAlertDialog(),
                                    ),
                                  ],
                                  child: const LoginPage(),
                                ),
                              )));
                },
                child: Container(
                  width: 300.0,
                  padding: const EdgeInsets.all(12.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: const Text(
                    "LOG IN",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

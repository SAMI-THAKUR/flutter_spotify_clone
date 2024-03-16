import 'package:flutter/material.dart';
import './signuo_login.dart';

class AuthUI extends StatelessWidget {
  const AuthUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          './images/spotify_logo_banner_black.png',
          height: MediaQuery.of(context).size.height * 0.12,
        ),
        const Text(
          "Millions of songs. \n Free on Spotify.",
          style: TextStyle(
            fontFamily: 'Proxima Nova',
            fontSize: 30.0,
            fontWeight: FontWeight.w900,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Continue with",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupOrLogin()));
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  margin: const EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0.0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.mail_outline,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "EMAIL",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

//Basic UI Classes
class ShowCustomAlertDialog extends ChangeNotifier {
  Future showCustomDialog(BuildContext context, String message) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(message),
            actions: <Widget>[
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Okay!"),
                ),
              ),
            ],
          );
        });
  }
}

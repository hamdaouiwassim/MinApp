import 'package:flutter/material.dart';
import 'package:minicipalite_app/ui/screens/authenticate/register.dart';
import 'package:minicipalite_app/ui/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(view: toggleView);
    } else {
      return Register(view: toggleView);
    }
  }
}

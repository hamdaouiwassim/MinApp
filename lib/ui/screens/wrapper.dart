import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minicipalite_app/models/user.dart';
import 'package:minicipalite_app/ui/screens/auth/auth.dart';
import 'package:minicipalite_app/ui/screens/authenticate/authenticate.dart';
import 'package:minicipalite_app/ui/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    print(user);
    if (user == null) {
      return SignInUI();
    } else {
      return Home();
    }
  }
}

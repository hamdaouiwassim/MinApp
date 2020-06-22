import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minicipalite_app/models/models.dart';
import 'package:minicipalite_app/services/services.dart';

import 'package:provider/provider.dart';

class AuthWidgetBuilder extends StatelessWidget {
  const AuthWidgetBuilder({Key key, @required this.builder}) : super(key: key);
  final Widget Function(BuildContext, AsyncSnapshot<FirebaseUser>) builder;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return StreamBuilder<FirebaseUser>(
      stream: authService.user,
      builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
        final FirebaseUser user = snapshot.data;
        if (user != null) {
          /*
          * For any other Provider services that rely on user data can be
          * added to the following MultiProvider list.
          * Once a user has been detected, a re-build will be initiated.
           */
          return MultiProvider(
            providers: [
              Provider<FirebaseUser>.value(value: user),
              StreamProvider<User>.value(
                  value: AuthService().streamFirestoreUser(user))
            ],
            child: builder(context, snapshot),
          );
        }
        return builder(context, snapshot);
      },
    );
  }
}

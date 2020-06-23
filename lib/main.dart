import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minicipalite_app/constants/app_theme.dart';
import 'package:minicipalite_app/localizations.dart';
import 'package:minicipalite_app/models/user.dart';
import 'package:minicipalite_app/repositories/post_repository.dart';
import 'package:minicipalite_app/services/auth_widget_builder.dart';
import 'package:minicipalite_app/services/services.dart';
import 'package:minicipalite_app/ui/screens/auth/auth.dart';
import 'package:minicipalite_app/ui/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:minicipalite_app/utils/locator.dart';
import 'package:minicipalite_app/routes/router.gr.dart';

void main() {
  setupLocator();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => locator<PostRepository>()),
    ChangeNotifierProvider<AuthService>(
      create: (context) => AuthService(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('user ${AuthService().user} ');
    //  return Consumer<AuthService>(builder: (_, auth, __) {
    //  return AuthWidgetBuilder(builder:
    //      (BuildContext context, AsyncSnapshot<FirebaseUser> userSnapshot) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return StreamBuilder<FirebaseUser>(
        stream: authService.user,
        builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
          final FirebaseUser user = snapshot.data;

          return MultiProvider(
            providers: [
              StreamProvider<FirebaseUser>.value(
                  value: FirebaseAuth.instance.onAuthStateChanged),
              StreamProvider<User>.value(
                  value: AuthService().streamFirestoreUser(user))
            ],
            child: MaterialApp(
              locale: AppLocalizations.languages.keys.first,
              localizationsDelegates: [
                const AppLocalizationsDelegate(),
              ],
              supportedLocales: AppLocalizations.languages.keys.toList(),
              debugShowCheckedModeBanner: false,
              builder: ExtendedNavigator<Router>(
                router: Router(),
              ),
              title: 'Minicipalite App',
              theme: AppThemes.lightTheme,
              //   home: (userSnapshot?.data?.uid != null) ? Home() : SignInUI(),
            ),
          );

          //  });
          //  });
        });
  }
}

/*void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}*/

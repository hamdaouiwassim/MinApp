import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:minicipalite_app/constants/app_theme.dart';
import 'package:minicipalite_app/localizations.dart';
import 'package:minicipalite_app/models/user.dart';
import 'package:minicipalite_app/repositories/post_repository.dart';
import 'package:provider/provider.dart';
import 'package:minicipalite_app/utils/locator.dart';
import 'package:minicipalite_app/routes/router.gr.dart';

import 'services/services.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('user ${AuthService().user} ');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => locator<PostRepository>()),
        ChangeNotifierProvider<AuthService>(
          create: (context) => AuthService(),
        )
      ],
      child: StreamProvider<User>.value(
        value: AuthService().user,
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
        ),
      ),
    );
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

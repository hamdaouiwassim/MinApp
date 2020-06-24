import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minicipalite_app/localizations.dart';
import 'package:minicipalite_app/services/services.dart';
import 'package:minicipalite_app/ui/widgets/widgets.dart';
import 'package:minicipalite_app/utils/utils.dart';
import 'package:minicipalite_app/routes/router.gr.dart';

class SignInUI extends StatefulWidget {
  _SignInUIState createState() => _SignInUIState();
}

class _SignInUIState extends State<SignInUI> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _loading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);

    return Scaffold(
      key: _scaffoldKey,
      body: LoadingScreen(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    LogoGraphicHeader(
                      tag: "sign_in",
                      file: File(""),
                      imageUrl: "",
                    ),
                    SizedBox(height: 48.0),
                    FormInputFieldWithIcon(
                      controller: _email,
                      iconPrefix: Icons.email,
                      labelText: labels.auth.emailFormField,
                      validator: Validator(labels).email,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => null,
                      onSaved: (value) => _email.text = value,
                    ),
                    FormVerticalSpace(),
                    FormInputFieldWithIcon(
                      controller: _password,
                      iconPrefix: Icons.lock,
                      labelText: labels.auth.passwordFormField,
                      validator: Validator(labels).password,
                      obscureText: true,
                      onChanged: (value) => null,
                      onSaved: (value) => _password.text = value,
                      maxLines: 1,
                    ),
                    FormVerticalSpace(),
                    PrimaryButton(
                        labelText: labels.auth.signInButton,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              _loading = true;
                            });
                            AuthService _auth = AuthService();
                            bool status = await _auth
                                .signInWithEmailAndPassword(
                                    _email.text, _password.text)
                                .then((status) {
                              setState(() {
                                _loading = false;
                              });
                              return status;
                            });
                            if (!status) {
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text(labels.auth.signInError),
                              ));
                            }
                          }
                        }),
                    FormVerticalSpace(),
                    LabelButton(
                      labelText: labels.auth.resetPasswordLabelButton,
                      onPressed: () => ExtendedNavigator.of(context)
                          .pushNamed(Routes.resetPasswordUI),
                    ),
                    LabelButton(
                      labelText: labels.auth.signUpLabelButton,
                      onPressed: () => ExtendedNavigator.of(context)
                          .pushNamed(Routes.signUpUI),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        inAsyncCall: _loading,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}

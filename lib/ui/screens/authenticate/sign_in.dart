import 'package:flutter/material.dart';
import 'package:minicipalite_app/services/services.dart';
import 'package:minicipalite_app/utils/constants.dart';

class SignIn extends StatefulWidget {
  final Function view;
  SignIn({this.view});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();

  // text fields state
  String email = "";
  String password = "";
  String err = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        elevation: 0.0,
        title: Text("Sign In"),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: Text("Register", style: TextStyle(color: Colors.white)),
            onPressed: () {
              widget.view();
            },
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration:
                      textInputDecoration.copyWith(hintText: "Email ..."),
                  validator: (val) => val.isEmpty ? 'Enter an email ' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration:
                      textInputDecoration.copyWith(hintText: "Password ..."),
                  validator: (val) => val.length < 6
                      ? 'Enter the password 6+ chars as long '
                      : null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.white,
                  child: Text("Sign In"),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.signInWithEmailAndPassword(
                          email, password);
                      //dynamic result = await _auth.registerWithEmailAndPassword(email,password);
                      if (result == null) {
                        setState(() =>
                            err = "Could not sign in with these credentiels");
                      }
                    }
                  },
                ),
                SizedBox(height: 20.0),
                Text(
                  err,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
              ],
            ),
          )

          /* RaisedButton(
          child: Text("Sign in anon"),
          onPressed: () async{
            dynamic result = await _auth.signInAnon();
            if ( result == null ){
                print("erreur signing in ");
            }else{
                print("signed in ");
                print(result.uid);
            }
          },

        ),*/

          ),
    );
  }
}

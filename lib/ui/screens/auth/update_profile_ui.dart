import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minicipalite_app/repositories/post_repository.dart';
import 'package:minicipalite_app/ui/widgets/post_card.dart';
import 'package:provider/provider.dart';
import 'package:minicipalite_app/models/models.dart';
import 'package:minicipalite_app/localizations.dart';
import 'package:minicipalite_app/services/services.dart';
import 'package:minicipalite_app/ui/widgets/widgets.dart';
import 'package:minicipalite_app/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class UpdateProfileUI extends StatefulWidget {
  _UpdateProfileUIState createState() => _UpdateProfileUIState();
}

class _UpdateProfileUIState extends State<UpdateProfileUI> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _name = new TextEditingController();
  final TextEditingController _email = new TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _loading = false;
  File _image;
  String _uploadedFileURL;
  bool _photoChanged;
  List<Post> posts;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text("Profile")),
      body: LoadingScreen(
        child: updateProfileForm(context),
        inAsyncCall: _loading,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      drawer: MyAppDrawer(),
    );
  }

  updateProfileForm(BuildContext context) {
    final User user = Provider.of<User>(context);
    final productProvider = Provider.of<PostRepository>(context);
    _name.text = user?.name;
    _email.text = user?.email;
    _uploadedFileURL = user?.photoUrl;
    final labels = AppLocalizations.of(context);
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: <Widget>[
                    LogoGraphicHeader(
                      imageUrl: _uploadedFileURL,
                      file: _image,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        size: 30.0,
                      ),
                      onPressed: () {
                        _showChoiceDialog(context);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 48.0),
                FormInputFieldWithIcon(
                  controller: _name,
                  iconPrefix: Icons.person,
                  labelText: labels.auth.nameFormField,
                  validator: Validator(labels).name,
                  onChanged: (value) => null,
                  onSaved: (value) => _name.text = value,
                ),
                FormVerticalSpace(),
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
                PrimaryButton(
                    labelText: labels.auth.updateUser,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                        _formKey.currentState.save();
                        User _updatedUser = User(
                            uid: user?.uid,
                            name: _name.text,
                            email: _email.text,
                            photoUrl: _uploadedFileURL);
                        if (_photoChanged)
                          uploadPicture(context).whenComplete(() {
                            _updatedUser.photoUrl = _uploadedFileURL;
                            //   Navigator.pop(context);
                            _updateUserConfirm(
                                context, _updatedUser, user?.email);
                          });
                        else {
                          _updateUserConfirm(
                              context, _updatedUser, user?.email);
                        }
                      }
                    }),
                FormVerticalSpace(),

                /*      LabelButton(
                    labelText: labels.auth.changePasswordLabelButton,
                    onPressed: () => Navigator.pushNamed(
                        context, '/reset-password',
                        arguments: user.email)),*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text('Choose photo from Gallery'),
                    onTap: () {
                      _openGallery(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: Text('Take a Photo'),
                    onTap: () {
                      _openCamera(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  _openGallery(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      _image = picture;
      _photoChanged = true;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      _image = picture;
      _photoChanged = true;
    });
    Navigator.of(context).pop();
  }

  Future<bool> _updateUserConfirm(
      BuildContext context, User updatedUser, String oldEmail) async {
    final labels = AppLocalizations.of(context);
    AuthService _auth = AuthService();
    final TextEditingController _password = new TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            title: Text(
              labels.auth.enterPassword,
            ),
            content: FormInputFieldWithIcon(
              controller: _password,
              iconPrefix: Icons.lock,
              labelText: labels.auth.passwordFormField,
              validator: Validator(labels).password,
              obscureText: true,
              onChanged: (value) => null,
              onSaved: (value) => _password.text = value,
              maxLines: 1,
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text(labels.auth.cancel.toUpperCase()),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    _loading = false;
                  });
                },
              ),
              new FlatButton(
                child: new Text(labels.auth.submit.toUpperCase()),
                onPressed: () async {
                  setState(() {
                    _loading = true;
                  });
                  Navigator.of(context).pop();
                  try {
                    await _auth
                        .updateUser(updatedUser, oldEmail, _password.text)
                        .then((result) {
                      setState(() {
                        _loading = false;
                      });

                      if (result == true) {
                        _scaffoldKey.currentState.showSnackBar(
                          SnackBar(
                            content: Text(labels.auth.updateUserSuccessNotice),
                          ),
                        );
                      }
                    });
                  } on PlatformException catch (error) {
                    //List<String> errors = error.toString().split(',');
                    // print("Error: " + errors[1]);
                    print(error.code);
                    String authError;
                    switch (error.code) {
                      case 'ERROR_WRONG_PASSWORD':
                        authError = labels.auth.wrongPasswordNotice;
                        break;
                      default:
                        authError = labels.auth.unknownError;
                        break;
                    }
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text(authError),
                    ));
                    setState(() {
                      _loading = false;
                    });
                  }
                },
              )
            ],
          );
        });
  }

  Future uploadPicture(BuildContext context) async {
    /* setState(() {
      isLoading = true;
    });*/
    if (_formKey.currentState.validate()) {
      StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child("User Pictures");
      var timeKey = new DateTime.now();
      String fileName = basename(_image.path);
      final StorageUploadTask uploadTask =
          firebaseStorageRef.child(fileName).putFile(_image);
      var imgURL = await (await uploadTask.onComplete).ref.getDownloadURL();
      _uploadedFileURL = imgURL.toString();
    }

    setState(() {
      print("Profile Picture uploaded");
      //  isLoading = false;
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text(' Photo Uploaded')));
    });
  }
}

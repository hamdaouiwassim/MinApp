import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:minicipalite_app/models/post.dart';
import 'package:minicipalite_app/models/user.dart';
import 'package:minicipalite_app/repositories/post_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:minicipalite_app/services/auth.dart';
import 'package:minicipalite_app/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final _formKey = GlobalKey<FormState>();
  String productType = '';
  String title;
  String price;
  File _image;
  String _uploadedFileURL;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Widget loadingIndicator = isLoading
        ? new AlertDialog(
            content: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                new CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("Uploading"),
                ),
              ],
            ),
          )
        : new Container();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Add Post'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: new Wrap(
            direction: Axis.vertical,
            children: <Widget>[
              /*  TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Product Title',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Product Title';
                    }
                  },
                  onSaved: (value) => title = value),*/
              SizedBox(
                height: 16,
              ),
              DropdownButton<String>(
                hint: Text('Sélectionnez un titre'),
                //   value: productType,
                onChanged: (String newValue) {
                  setState(() {
                    productType = newValue;
                  });
                },
                items: <String>[
                  'Eclairage',
                  'Routes et trottoirs',
                  'chiens lâches',
                  'le bruit',
                  'Empilage de la saleté et des déchets de construction',
                  'Construire sans licence',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                    ),
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: new SizedBox(
                  width: 180.0,
                  height: 180.0,
                  child: (_image != null)
                      ? Image.file(
                          _image,
                          fit: BoxFit.fill,
                        )
                      : Image.network(
                          "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                          fit: BoxFit.fill,
                        ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: IconButton(
                  icon: Icon(
                    Icons.add_a_photo,
                  ),
                  onPressed: () {
                    _showChoiceDialog(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: RaisedButton(
                  // splashColor: Colors.red,
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      uploadPicture(context).whenComplete(() {
                        Navigator.pop(context);
                        addPostToFirebase(context);
                      });

                      //  Scaffold.of(context).showSnackBar(
                      //            SnackBar(content: Text('  Uploaded Failed')));

                    }
                  },
                  child: Text('add Product',
                      style: TextStyle(color: Colors.white)),
                  color: Colors.blue,
                ),
              ),
              new Align(
                child: loadingIndicator,
                alignment: FractionalOffset.center,
              ),
            ],
          ),
        ),
      ),
      drawer: MyAppDrawer(),
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
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      _image = picture;
    });
    Navigator.of(context).pop();
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else
      return false;
  }

  void addPostToFirebase(BuildContext context) {
    var postProvider = Provider.of<PostRepository>(context);
    final user = Provider.of<User>(context);
    var timeKey = DateTime.now();
    var formatDate = new DateFormat('MMM d, yyyy');
    postProvider.addPost(Post(
      idUser: user.uid,
      title: productType.toLowerCase(),
      photo: _uploadedFileURL,
      date: formatDate.format(timeKey),
      longitude: 0,
      latitude: 0,
    ));
  }

  Future uploadPicture(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    if (validateAndSave()) {
      StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child("Post Images");
      var timeKey = new DateTime.now();
      String fileName = basename(_image.path);
      final StorageUploadTask uploadTask =
          firebaseStorageRef.child(fileName).putFile(_image);
      var imgURL = await (await uploadTask.onComplete).ref.getDownloadURL();
      _uploadedFileURL = imgURL.toString();
    }

    setState(() {
      print("Profile Picture uploaded");
      isLoading = false;
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text(' Photo Uploaded')));
    });
  }
}

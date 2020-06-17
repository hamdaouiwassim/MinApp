import 'package:flutter/material.dart';
import 'package:minicipalite_app/models/post.dart';
import 'package:minicipalite_app/repositories/post_repository.dart';

import 'package:provider/provider.dart';

class UpdatePost extends StatefulWidget {
  final Post post;

  UpdatePost({@required this.post});

  @override
  _UpdatePostState createState() => _UpdatePostState();
}

class _UpdatePostState extends State<UpdatePost> {
  final _formKey = GlobalKey<FormState>();

  String productType;

  String title;

  String price;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<PostRepository>(context);
    productType =
        widget.post.title[0].toUpperCase() + widget.post.title.substring(1);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Modify Product Details'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                  initialValue: widget.post.title,
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
                  onSaved: (value) => title = value),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                  initialValue: widget.post.date,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Price',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter The price';
                    }
                  },
                  onSaved: (value) => price = value),
              DropdownButton<String>(
                value: productType,
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
                  'Sélectionnez un titre'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              RaisedButton(
                splashColor: Colors.red,
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    await productProvider.updatePost(
                        Post(
                            title: title,
                            date: price,
                            photo: productType.toLowerCase()),
                        widget.post.id);
                    Navigator.pop(context);
                  }
                },
                child: Text('Modify Product',
                    style: TextStyle(color: Colors.white)),
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}

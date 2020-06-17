import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:minicipalite_app/models/post.dart';
import 'package:minicipalite_app/repositories/post_repository.dart';
import 'package:minicipalite_app/routes/router.gr.dart';
import 'package:minicipalite_app/services/auth.dart';
import 'package:minicipalite_app/services/services.dart';
import 'package:minicipalite_app/ui/widgets/post_card.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  List<Post> posts;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<PostRepository>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ExtendedNavigator.of(context).pushNamed(Routes.addPost);
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        elevation: 0.0,
        title: Text("Minicipalite"),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text("Log out"))
        ],
      ),
      body: Container(
        child: StreamBuilder(
            stream: productProvider.getAllPostsAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                posts = snapshot.data.documents
                    .map((doc) => Post.fromMap(doc.data, doc.documentID))
                    .toList();
                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (buildContext, index) =>
                      PostCard(post: posts[index]),
                );
              } else {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            }),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minicipalite_app/models/models.dart';
import 'package:minicipalite_app/repositories/post_repository.dart';
import 'package:minicipalite_app/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class MyPosts extends StatefulWidget {
  @override
  _MyPostsState createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
  List<Post> posts;
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<PostRepository>(context);
    final user = Provider.of<User>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Container(
        child: StreamBuilder(
            stream: productProvider.getMyPostsAsStream(user.uid),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                posts = snapshot.data.documents
                    .map((doc) => Post.fromMap(doc.data, doc.documentID))
                    .toList();
                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (buildContext, index) => PostCard(
                    post: posts[index],
                    postowner: true,
                  ),
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
      drawer: MyAppDrawer(),
    );
  }
}

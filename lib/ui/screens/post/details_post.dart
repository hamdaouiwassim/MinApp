import 'package:flutter/material.dart';
import 'package:minicipalite_app/models/post.dart';
import 'package:minicipalite_app/repositories/post_repository.dart';
import 'package:minicipalite_app/ui/screens/post/update_post.dart';
import 'package:provider/provider.dart';

class PostDetails extends StatelessWidget {
  final Post post;

  PostDetails({@required this.post});

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostRepository>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        actions: <Widget>[
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.delete_forever),
            onPressed: () async {
              await postProvider.removePost(post.id);
              Navigator.pop(context);
            },
          ),
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => UpdatePost(
                            post: post,
                          )));
            },
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: post.id,
            child: Image.network(
              post.photo,
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            post.title,
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 22,
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}

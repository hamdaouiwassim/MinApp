import 'package:flutter/material.dart';
import 'package:minicipalite_app/models/post.dart';
import 'package:minicipalite_app/ui/screens/post/details_post.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({Key key, this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => PostDetails(
                      post: post,
                    )));
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Card(
          elevation: 5,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: <Widget>[
                Hero(
                  tag: post.id,
                  child: Image.network(
                    post.photo,
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        post.title,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        post.date,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            color: Colors.black38),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

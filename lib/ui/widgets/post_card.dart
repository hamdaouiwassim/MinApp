import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:minicipalite_app/models/post.dart';
import 'package:minicipalite_app/repositories/post_repository.dart';
import 'package:minicipalite_app/routes/router.gr.dart';
import 'package:minicipalite_app/ui/screens/post/details_post.dart';
import 'package:provider/provider.dart';

class PostCard extends StatelessWidget {
  final Post post;
  final bool postowner;

  const PostCard({Key key, this.post, @required this.postowner})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostRepository>(context);
    void _showPopupMenu() async {
      await showMenu(
        context: context,
        color: Colors.white,
        position: RelativeRect.fromLTRB(100, 200, 50, 0),
        items: [
          PopupMenuItem(
            child: ListTile(leading: Icon(Icons.details), title: Text("View")),
          ),
          PopupMenuItem(
            child: ListTile(
              leading: Icon(Icons.edit),
              title: Text("Edit"),
              onTap: () => ExtendedNavigator.of(context).pushNamed(
                  Routes.addPost,
                  arguments: AddPostArguments(post: post)),
            ),
          ),
          PopupMenuItem(
              child: ListTile(
            leading: Icon(Icons.delete),
            title: Text('Delete'),
            onTap: () async {
              await postProvider.removePost(post.id);
              Navigator.pop(context);
            },
          ))
        ],
        elevation: 8.0,
      );
    }

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
                    height: MediaQuery.of(context).size.height * 0.31,
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
                      if (postowner)
                        IconButton(
                            icon: Icon(Icons.more_vert),
                            onPressed: _showPopupMenu)
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

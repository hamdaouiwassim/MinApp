import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:minicipalite_app/models/models.dart';
import 'package:minicipalite_app/models/post.dart';
import 'package:minicipalite_app/repositories/post_repository.dart';
import 'package:minicipalite_app/routes/router.gr.dart';
import 'package:minicipalite_app/services/auth.dart';
import 'package:minicipalite_app/services/services.dart';
import 'package:minicipalite_app/ui/widgets/post_card.dart';
import 'package:minicipalite_app/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //final AuthService _auth = AuthService();

  List<Post> posts;
  Icon cusIcon = Icon(
    Icons.search,
    color: Colors.white,
  );
  Widget cusSearchBar = Text('Home');
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<PostRepository>(context);
    final user = Provider.of<User>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ExtendedNavigator.of(context).pushNamed(Routes.addPost);
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 2.0,
        title: cusSearchBar,
        actions: <Widget>[
          IconButton(
            icon: cusIcon,
            onPressed: () {
              setState(() {
                if (this.cusIcon.icon == Icons.search) {
                  this.cusIcon = Icon(
                    Icons.close,
                    color: Colors.white,
                  );
                  this.cusSearchBar = TextField(
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Search Posts'),
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  );
                } else {
                  this.cusIcon = Icon(
                    Icons.search,
                    color: Colors.white,
                  );
                  this.cusSearchBar = Text('Home');
                }
              });
            },
          ),
        ],
      ),
      body: Container(
        child: StreamBuilder(
            stream: productProvider.getAllPostsAsStream(user.uid),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                posts = snapshot.data.documents
                    .map((doc) => Post.fromMap(doc.data, doc.documentID))
                    .toList();
                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (buildContext, index) => PostCard(
                    post: posts[index],
                    postowner: false,
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

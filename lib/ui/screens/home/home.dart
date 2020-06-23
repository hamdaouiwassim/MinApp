import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  _HomeState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredPosts = posts;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }
  //final AuthService _auth = AuthService();
  // controls the text label we use as a search bar
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  List<Post> filteredPosts;
  List<Post> posts;
  Icon _searchIcon = Icon(
    Icons.search,
    color: Colors.white,
  );
  Widget _appBarTitle = Text('Home');
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<PostRepository>(context);
    final user = Provider.of<FirebaseUser>(context);
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
        title: _appBarTitle,
        actions: <Widget>[
          IconButton(
            icon: _searchIcon,
            onPressed: _searchPressed,
          ),
        ],
      ),
      body: Container(
        child: StreamBuilder(
            stream: productProvider.getAllPostsAsStream(user.uid),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                List tempList = new List();
                tempList = snapshot.data.documents
                    .map((doc) => Post.fromMap(doc.data, doc.documentID))
                    .toList();
                posts = tempList;
                posts.shuffle();
                filteredPosts = posts;
                return _buildList();
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

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = Icon(
          Icons.close,
          color: Colors.white,
        );
        this._appBarTitle = TextField(
          controller: _filter,
          textInputAction: TextInputAction.go,
          decoration: InputDecoration(hintText: 'Search Posts'),
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        );
      } else {
        this._searchIcon = Icon(
          Icons.search,
          color: Colors.white,
        );
        this._appBarTitle = Text('Home');
        filteredPosts = posts;
        _filter.clear();
      }
    });
  }

  Widget _buildList() {
    if ((_searchText.isNotEmpty)) {
      List<Post> tempList = new List();
      for (int i = 0; i < filteredPosts.length; i++) {
        if (filteredPosts[i]
            .title
            .toString()
            .toLowerCase()
            .contains(_searchText.toLowerCase())) {
          tempList.add(filteredPosts[i]);
        }
      }
      filteredPosts = tempList;
    }
    return ListView.builder(
      itemCount: posts == null ? 0 : filteredPosts.length,
      itemBuilder: (buildContext, index) => PostCard(
        post: filteredPosts[index],
        postowner: false,
      ),
    );
  }
}

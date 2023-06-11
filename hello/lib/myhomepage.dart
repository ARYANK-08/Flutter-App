// ignore: file_names
import 'package:flutter/material.dart';
import 'database.dart';
import 'post.dart';
import 'postlist.dart';
import 'textInputWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyHomePage extends StatefulWidget {
  
  final User user;
  const MyHomePage(this.user, {super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Post> posts = [];

  void newPost(String text) {
    var post = Post(text, widget.user.displayName.toString());
    post.setId(savePost(post));
    setState(() {
      posts.add(post);
    });
  }

  void updatePosts() {
    getAllPosts().then((posts) => {
          setState(() {
            this.posts = posts;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    updatePosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello World"),
        backgroundColor: Theme.of(context).primaryColor,
        ),
      body: Column(children: [
        Expanded(child: PostList(posts,widget.user)),
        TextInputWidget(newPost),
        ]),
      );
  }
}

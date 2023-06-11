import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hello/database.dart';

class Post {
  String body;
  String author;
  Set usersLiked = {};
  late DatabaseReference _id;

  Post(this.body, this.author);

  void likePost(User user) {
    if (usersLiked.contains(user.uid)) {
      usersLiked.remove(user.uid);
    } else {
      usersLiked.add(user.uid);
    }
    update();
  }

  void update() {
    updatePost(this, _id);
  }

  void setId(DatabaseReference id) {
    _id = id;
  }

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'usersLiked': usersLiked.toList(),
      'body': body
    };
  }
}

Post createPost(record) {
  Map<String, dynamic> attributes = {
    'author': '',
    'usersLiked': [],
    'body': ''
  };

  record.forEach((key, value) => {attributes[key] = value});

  Post post = Post(attributes['body'], attributes['author']);
  post.usersLiked = Set.from(attributes['usersLiked']);
  return post;
}
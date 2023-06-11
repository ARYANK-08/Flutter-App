import 'package:firebase_database/firebase_database.dart';
import 'post.dart';

// ignore: deprecated_member_use
final databaseReference = FirebaseDatabase(databaseURL: 'https://hello-world-c16b5-default-rtdb.asia-southeast1.firebasedatabase.app/').ref();

DatabaseReference savePost(Post post) {
  var id = databaseReference.child('posts/').push();
  id.set(post.toJson());
  return id;
}

void updatePost(Post post, DatabaseReference id) {
  id.update(post.toJson());
}

Future<List<Post>> getAllPosts() async {
  DatabaseEvent event = await databaseReference.child('posts/').once();
  List<Post> posts = [];

  if (event.snapshot.value != null) {
    Map<dynamic, dynamic> snapshotValue = event.snapshot.value as Map<dynamic, dynamic>;
    snapshotValue.forEach((key, value) {
      Post post = createPost(value);
      post.setId(databaseReference.child('posts/').child(key.toString()));
      posts.add(post);
    });
  }

  return posts;
}




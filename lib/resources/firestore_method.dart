import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insta_clone/models/posts.dart';
import 'package:insta_clone/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethod {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //upload post
  Future<String> uplaodPost(
    String description,
    Uint8List file,
    String uid,
    String username,
    String profImage,
  ) async {
    String res = "some error occurred";
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('posts', file, true);
      String postId = const Uuid().v1();
      Post post = Post(
        description: description,
        uid: uid,
        datePublished: DateTime.now(),
        username: username,
        postUrl: photoUrl,
        profImage: profImage,
        likes: [],
        postId: postId,
      );
      _firestore.collection('posts').doc(postId).set(post.toJason());
      res = "success";
      return res;
    } catch (e) {
      res = e.toString();
      return res;
    }
  }
}

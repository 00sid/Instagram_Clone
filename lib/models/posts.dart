import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String username;
  final String postId;
  final datePublished;
  final String profImage;
  final String postUrl;
  final likes;

  Post({
    required this.description,
    required this.uid,
    required this.datePublished,
    required this.username,
    required this.postUrl,
    required this.profImage,
    required this.likes,
    required this.postId,
  });

  Map<String, dynamic> toJason() => {
        'description': description,
        'uid': uid,
        'username': username,
        'postId': postId,
        'datePublished': datePublished,
        'profImage': profImage,
        'postUrl': postUrl,
        'likes': likes,
      };
  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Post(
        username: snapshot['username'],
        uid: snapshot['uid'],
        description: snapshot['description'],
        postId: snapshot['postId'],
        datePublished: snapshot['datePublished'],
        profImage: snapshot['profImage'],
        likes: snapshot['likes'],
        postUrl: snapshot['postUrl']);
  }
}

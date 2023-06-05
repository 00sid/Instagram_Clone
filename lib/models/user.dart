import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String username;
  final String bio;
  final String photoUrl;
  final List followers;
  final List following;

  User({
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.username,
    required this.bio,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toJason() => {
        'email': email,
        'uid': uid,
        'photoUrl': photoUrl,
        'username': username,
        'bio': bio,
        'followers': followers,
        'following': following,
      };
  static User? fromSnap(DocumentSnapshot<Map<String, dynamic>> snap) {
    var snapshot = snap.data();
    if (snapshot == null) return null;

    return User(
      email: snapshot['email'],
      uid: snapshot['uid'],
      photoUrl: snapshot['photoUrl'],
      username: snapshot['username'],
      bio: snapshot['bio'],
      followers: snapshot['followers'],
      following: snapshot['following'],
    );
  }
}

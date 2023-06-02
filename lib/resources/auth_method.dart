import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta_clone/models/user.dart' as model;
import 'package:insta_clone/resources/storage_methods.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //sign up users
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();
    return model.User.fromSnap(snap);
  }

  Future<String> signUpUser({
    required String email,
    required String password,
    required String userName,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error occured";
    try {
      //register user
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          userName.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        String photoURL = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        model.User user = model.User(
          email: email,
          uid: cred.user!.uid,
          photoUrl: photoURL,
          username: userName,
          bio: bio,
          followers: [],
          following: [],
        );
        // add user to database
        await _firestore.collection('users').doc(cred.user!.uid).set(
              user.toJason(),
            );
        res = "Success";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        res = "Email is badly formatted";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //login user
  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Please enter all field";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}

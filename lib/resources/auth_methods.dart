import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_exam_project/model/my_firestore_user.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<MyFirestoreUser> getUserDetails() async {
    User? currentUser = _auth.currentUser;
    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser!.uid).get();
    return MyFirestoreUser.fromSnap(snap);
  }

  Future<void> signUpUser({
    required String email,
    required String password,
  }) async {
    try {
      //1) register user in the authentication
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      MyFirestoreUser firestoreUser = MyFirestoreUser(
          email: email,
          password: password,
          photoUrl: '',
          name: '',
          surname: '',
          group: '',
          availableLocalEvents: [],
          availableNationalEvents: [],
          chosenEvents: [],
          isBoss: false);

      //2) register user in the database using the class User
      await _firestore
          .collection('users')
          .doc(credential.user!.uid)
          .set(firestoreUser.toJson());
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
    }
  }
}

import 'package:flutter/material.dart';
import 'package:my_exam_project/model/my_firestore_user.dart';
import 'package:my_exam_project/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  final AuthMethods _authMethods = AuthMethods();
  MyFirestoreUser? _firestoreUser;
  String _email = '';

  MyFirestoreUser? get getMyFiredtoreUser => _firestoreUser;
  String get getEmail => _email;

  Future<void> updateUserInformation() async {
    MyFirestoreUser firestoreUser = await _authMethods.getUserDetails();
    _firestoreUser = firestoreUser;
    _email = _firestoreUser!.email;
    notifyListeners();
  }
}

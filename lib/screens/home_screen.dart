import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_exam_project/providers/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late UserProvider _userProvider;
  late final User? _loggedUser;

  void getCurrentUser() {
    try {
      User? user = _auth.currentUser;
      debugPrint('dentro 4');
      if (user != null) {
        debugPrint('dentro 5');
        _loggedUser = user;
        debugPrint(_loggedUser?.email);
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<String> getEmailFromFirestore() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(_loggedUser!.uid)
        .get();

    return (snap.data() as Map<String, dynamic>)['email'];
  }

  void signOut() async {
    try {
      await _auth.signOut();
      _loggedUser = null;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    debugPrint('dentro 3');
    super.initState();
    getCurrentUser();
    _userProvider = Provider.of<UserProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('Questa è la colonna della home screen'),
            Text(_userProvider.getMyFiredtoreUser!.email),
            FilledButton(
                onPressed: () {
                  try {
                    signOut();
                  } catch (e) {
                    debugPrint(e.toString());
                  }
                },
                child: Text('SIGN OUT'))
          ],
        ),
      ),
    );
  }
}

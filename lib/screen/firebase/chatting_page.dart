import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChattingPage extends StatefulWidget {
  static String routeName = 'chattingPage';
  const ChattingPage({Key? key}) : super(key: key);

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  @override
  void dispose() {
    _authentication.signOut();
    print('sign out');
    super.dispose();
  }

  void getCurrentUser() {
    final user = _authentication.currentUser;
    if (user != null) {
      try {
        loggedUser = user;
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Text(
              'Ah, U Finally get this Chatting Page \n your id is "${_authentication.currentUser?.email}"')),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//firebase authentication
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginPage extends StatefulWidget {
  static String routeName = 'googleLoginPage';
  const GoogleLoginPage({Key? key}) : super(key: key);

  @override
  State<GoogleLoginPage> createState() => _GoogleLoginPageState();
}

class _GoogleLoginPageState extends State<GoogleLoginPage> {
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(30),
              child: MaterialButton(
                onPressed: () async {
                  await signInWithGoogle();
                  setState(() {});
                },
                color: Colors.green,
                child: Text("Google Login",
                    style: GoogleFonts.notoSans(
                        color: Colors.white, fontSize: 18)),
              )),
          Text(FirebaseAuth.instance.currentUser.toString()),
          Padding(
              padding: const EdgeInsets.all(30),
              child: MaterialButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  setState(() {});
                },
                color: Colors.green,
                child: Text("Google Sign-out",
                    style: GoogleFonts.notoSans(
                        color: Colors.white, fontSize: 18)),
              ))
        ],
      )),
    );
  }
}

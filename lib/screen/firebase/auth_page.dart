import 'dart:io';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
//firebase authentication
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_practice_app/screen/firebase/chatting_page.dart';

//for google sign in
import 'package:google_sign_in/google_sign_in.dart';

//for apple sign in
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:crypto/crypto.dart';

class AuthPage extends StatefulWidget {
  static String emailLoginPageRouteName = 'authPage';
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _formKey = GlobalKey<FormState>();
  String userEmail = '';
  String userName = '';
  String userPassword = '';

  //어스 인스턴스를 만들어주면 사용자 등록/ 로그인 등 기능이 포함된 메서드 사용이 가능하다
  final _authentication = FirebaseAuth.instance;

  void _save() {
    _formKey.currentState?.save();
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

//apple
  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<UserCredential> signInWithApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
      rawNonce: rawNonce,
    );

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom: _tabBar(),
        ),
        body: TabBarView(controller: _tabController, children: [
          _emailLoginWidget(),
          _emailSignUpWidget(),
          _socialLoginWidget()
        ]));
  }

  Widget _emailLoginWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {
                    userEmail = value!;
                  },
                  onChanged: (value) {
                    userEmail = value;
                  },
                  key: const ValueKey(1),
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(6),
                      hintText: 'user Email id',
                      prefixIcon: Icon(
                        Icons.account_circle_rounded,
                        color: Colors.green,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(30)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  onSaved: (value) {
                    userPassword = value!;
                  },
                  onChanged: (value) {
                    userPassword = value;
                  },
                  key: const ValueKey(2),
                  obscureText: true,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(6),
                      hintText: 'password',
                      prefixIcon: Icon(
                        Icons.key,
                        color: Colors.green,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(30)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: MaterialButton(
                  onPressed: () async {
                    _save();
                    try {
                      final newUser =
                          await _authentication.signInWithEmailAndPassword(
                              email: userEmail, password: userPassword);
                      if (newUser.user != null) {
                        Get.toNamed('chattingPage');
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailSignUpWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {
                    userEmail = value!;
                    print('saved');
                  },
                  onChanged: (value) {
                    userEmail = value;
                    print('changed');
                  },
                  key: const ValueKey(3),
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(6),
                      hintText: 'does u have an email?',
                      prefixIcon: Icon(
                        Icons.account_circle_rounded,
                        color: Colors.green,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(30)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  onSaved: (value) {
                    userName = value!;
                  },
                  onChanged: (value) {
                    userName = value;
                  },
                  key: const ValueKey(4),
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(6),
                      hintText: 'let me know your Nickname',
                      prefixIcon: Icon(
                        Icons.perm_identity_sharp,
                        color: Colors.green,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(30)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  onSaved: (value) {
                    userPassword = value!;
                  },
                  onChanged: (value) {
                    userPassword = value;
                  },
                  key: const ValueKey(5),
                  obscureText: true,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(6),
                      hintText: 'type yourpassword',
                      prefixIcon: Icon(
                        Icons.key,
                        color: Colors.green,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(30)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: MaterialButton(
                  onPressed: () async {
                    _save();
                    print('${userName}, ${userEmail}, ${userPassword}');
                    try {
                      final newUser =
                          await _authentication.createUserWithEmailAndPassword(
                              email: userEmail, password: userPassword);

                      if (newUser.user != null) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const ChattingPage();
                        }));
                      }
                    } catch (e) {
                      print(e);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('에러가 났습니다. 제발..'),
                      ));
                    }
                  },
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialLoginWidget() {
    return Center(
        child: Column(
      children: [
        Container(
            width: 300,
            height: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/sign_in_illust.jpg'),
                  fit: BoxFit.cover),
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                alignment: Alignment.centerRight,
                child: const Text("current account :  "),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                alignment: Alignment.centerLeft,
                child: Text(
                    FirebaseAuth.instance.currentUser?.email.toString() ??
                        "로그인 되지 않음"),
              ),
            ],
          ),
        ),
        _signInButtonWidget(
          title: 'Sign-in with Google',
          imagePath: 'assets/images/google_logo.png',
          onTap: () async {
            await signInWithGoogle();
            setState(() {});
          },
        ),
        _signInButtonWidget(
          title: 'Sign-in with Apple',
          imagePath: 'assets/images/apple_logo.png',
          onTap: () async {
            try {
              await signInWithApple();
            } catch (e) {
              print(e);
            }
            setState(() {});
          },
        ),
      ],
    ));
  }

  Widget _signInButtonWidget(
      {required String imagePath,
      required String title,
      required VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 300,
          height: 60,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.green,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(30)),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(imagePath))),
              ),
              Text(title,
                  style:
                      GoogleFonts.notoSans(color: Colors.black, fontSize: 18))
            ],
          ),
        ),
      ),
    );
  }

  TabBar _tabBar() {
    return TabBar(controller: _tabController, tabs: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Log in',
          style: GoogleFonts.niramit(color: Colors.white, fontSize: 18),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Sign up',
          style: GoogleFonts.niramit(color: Colors.white, fontSize: 18),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Social Sign In',
          style: GoogleFonts.niramit(color: Colors.white, fontSize: 18),
        ),
      ),
    ]);
  }
}

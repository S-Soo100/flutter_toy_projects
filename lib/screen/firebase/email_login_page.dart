import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//firebase authentication
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_practice_app/screen/firebase/chatting_page.dart';

class EmailLoginPage extends StatefulWidget {
  static String emailLoginPageRouteName = 'emailLoginPage';
  const EmailLoginPage({Key? key}) : super(key: key);

  @override
  State<EmailLoginPage> createState() => _EmailLoginPageState();
}

class _EmailLoginPageState extends State<EmailLoginPage>
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

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom: _loginOrSignup(),
        ),
        body: TabBarView(controller: _tabController, children: [
          Container(
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)))),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: MaterialButton(
                        onPressed: () async {
                          _save();
                          try {
                            final newUser = await _authentication
                                .signInWithEmailAndPassword(
                                    email: userEmail, password: userPassword);
                            if (newUser.user != null) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const ChattingPage();
                              }));
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
          ),
          Container(
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)))),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)))),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: MaterialButton(
                        onPressed: () async {
                          _save();
                          print('${userName}, ${userEmail}, ${userPassword}');
                          try {
                            final newUser = await _authentication
                                .createUserWithEmailAndPassword(
                                    email: userEmail, password: userPassword);

                            if (newUser.user != null) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const ChattingPage();
                              }));
                            }
                          } catch (e) {
                            print(e);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
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
          ),
        ]));
  }

  TabBar _loginOrSignup() {
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
    ]);
  }
}

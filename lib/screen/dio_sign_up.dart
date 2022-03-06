import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_practice_app/widgets/buttonBox.dart';
import 'package:my_practice_app/widgets/text_form_widget.dart';

class DioSignUpHome extends StatefulWidget {
static String DioSignUpHomeRouteName = 'dioSignUpHome';
  const DioSignUpHome({Key? key}) : super(key: key);

  @override
  State<DioSignUpHome> createState() => _DioSignUpHomeState();
}

class _DioSignUpHomeState extends State<DioSignUpHome> {

  final formKey = GlobalKey<FormState>();
  late TextEditingController _emailTextController;
  late TextEditingController _userNameTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _nickNameTextController;
  late TextEditingController _phoneNumberTextController;
  final String appVersion = '1.0.0';
  final String serverUrl = "http://52.79.216.55:3000";

  @override
  void initState() {
    _emailTextController =
        TextEditingController();
    _passwordTextController =
        TextEditingController();
    _userNameTextController =
        TextEditingController();
    _nickNameTextController =
        TextEditingController();
    _phoneNumberTextController =
        TextEditingController();
    super.initState();
  }

  void submit() async {
    await emailSignUp(
      email: _emailTextController.text.trim(),
      password: _passwordTextController.text.trim(),
      nickname: _nickNameTextController.text.trim(),
      username: _userNameTextController.text.trim(),
      phone: _phoneNumberTextController.text,
      appVersion: appVersion,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('processing'),
        actions: [

          IconButton(onPressed: () {
            Navigator.pushNamed(context, 'home');
          }, icon: const Icon(Icons.home))
        ],),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormWidget(
                  boxName: 'E-Mail',
                  textEditingController: _emailTextController,
                ),
                TextFormWidget(
                  boxName: 'Passwords',
                  textEditingController: _passwordTextController,
                ),
                TextFormWidget(
                  boxName: 'Your Name',
                  textEditingController: _userNameTextController,
                ),
                TextFormWidget(
                  boxName: 'NickName',
                  textEditingController: _nickNameTextController,
                ),
                TextFormWidget(
                  boxName: 'PhoneNumber',
                  textEditingController: _phoneNumberTextController,
                ),
                ButtonBoxWidget(
                    buttonName: '회원가입',
                    onPressed: () {
                      submit();
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> emailSignUp({required String email,
    required String password,
    required String username,
    required String nickname,
    required String appVersion,
    required String phone}) async {
    Dio dio = Dio();
    try {
      Response response = await dio.post(
          "$serverUrl/user/",
          queryParameters: {
            "email": email,
            "password": password,
            "username": username,
            "phone": phone,
            "appVersion": appVersion,
            "profiles": [
              {
                "nickname": nickname,
              }
            ]
          }
      );
      if (response.statusCode == 200) {
        final jsonBody = json.decode(response.data);
        return true;
      } else { // 200 안뜨면 에러
        return false;
      }
    } catch (e) {
      Exception(e);
    } finally {
      dio.close();
    }
    return false;
  }
}

import 'package:flutter/material.dart';
import 'package:my_practice_app/screen/provider_practice.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'my practice app',
        theme: ThemeData(
        primarySwatch: Colors.grey,),
        initialRoute : 'home',
        routes : {
          'home' : (context) => MyHomePage(),
          'providerHome' : (context) => ProviderHome(),
        }
    );
  }
}
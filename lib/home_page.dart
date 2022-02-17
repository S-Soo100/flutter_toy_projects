import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  static const String MyHomePageRouteName = 'home';
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(child: _routeButton(context: context),),
    );
  }

  Widget _routeButton({required context}){
    return InkWell(
      child: Container(
        color: Colors.red,
        width: 100,
        height: 100,
      ),
      onTap: (){Navigator.pushNamed(context, 'providerHome');},
    );
  }
}

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
      appBar: AppBar(
        title: const Text('Home Route'),
      ),
      body: Center(
        child: Column(
          children: [
            Column(
              children: [
                Container(child: _routeButton(context: context),),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _routeButton({required context}){
    return InkWell(
      child: Container(
        child: Text('프로바이더 예제'),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        border: Border.all(
    color: Colors.black,
        style: BorderStyle.solid,
    width: 1
        ),),
        width: 200,
        height: 80,
      ),
      onTap: (){Navigator.pushNamed(context, 'providerHome');},
    );
  }
}

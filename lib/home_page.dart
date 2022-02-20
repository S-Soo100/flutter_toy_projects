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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              _routeButton(context: context, title: 'counter with provider', router: 'providerHome'),
              _routeButton(context: context, title: 'counter withOut provider', router: 'noProviderHome'),
              _routeButton(context: context, title: 'shopping cart provider', router: 'shoppingCartProviderHome'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _routeButton({required context, required title, required router}){
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Center(child: Text(title)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        border: Border.all(
    color: Colors.black,
        style: BorderStyle.solid,
    width: 6
        ),),
        width: 200,
        height: 80,
      ),
      onTap: (){Navigator.pushNamed(context, router);},
    );
  }
}

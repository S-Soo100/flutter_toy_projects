import 'package:flutter/material.dart';

class ProviderHome extends StatelessWidget {
  static const String ProviderHomeRouteName = 'providerHome';
  const ProviderHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:_routeButton(context: context)
    );
  }

  Widget _routeButton({required context}){
  return InkWell(
  child: Container(
  color: Colors.blue,
  width: 100,
  height: 100,
  ),
  onTap: (){Navigator.pushNamed(context, 'home');},
  );
}
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: _rectangleButton(
                  onTap: () {},
                  color: Colors.blue,
                  child: Image.network(
                      "https://firebase.google.com/images/brand-guidelines/logo-standard.png?hl=ko"),
                ),
              ),
              _rectangleButton(
                onTap: () =>
                    Navigator.pushNamed(context, 'skeletonLoadingPractice'),
                color: Colors.lightGreen,
                child: Text(
                  'Skeleton Loading',
                  style: GoogleFonts.alike(
                      textStyle: Theme.of(context).textTheme.headline4,
                      color: Colors.white),
                ),
              ),
              _routeButton(
                  context: context,
                  title: 'counter with provider',
                  router: 'providerHome'),
              _routeButton(
                  context: context,
                  title: 'counter withOut provider',
                  router: 'noProviderHome'),
              _routeButton(
                  context: context,
                  title: 'shopping cart provider',
                  router: 'shoppingCartProviderHome'),
              _routeButton(
                  context: context,
                  title: 'dio Sign-Up',
                  router: 'dioSignUpHome'),
              _routeButton(
                  context: context, title: 'DioTest', router: 'dioTest'),
              _routeButton(
                  context: context,
                  title: 'HttpCloneCoding',
                  router: 'httpCloneCoding'),
              _routeButton(
                  context: context,
                  title: 'httpWeatherLoadingScreen',
                  router: 'httpWeatherLoadingScreenRouteName'),
            ],
          ),
        ),
      ),
    );
  }

  InkWell _rectangleButton(
      {required Widget child,
      required Function() onTap,
      required Color color}) {
    return InkWell(
      onTap: onTap,
      child: Expanded(
          child: Container(
              height: 80,
              alignment: Alignment.center,
              color: color,
              child: child)),
    );
  }

  Widget _routeButton({required context, required title, required router}) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Center(
            child: Text(
          title,
          style: const TextStyle(
            fontSize: 17,
          ),
          textAlign: TextAlign.center,
        )),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: Colors.black38, style: BorderStyle.solid, width: 3),
        ),
        width: 240,
        height: 45,
      ),
      onTap: () {
        Navigator.pushNamed(context, router);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:device_info_plus/device_info_plus.dart';

class MyHomePage extends StatefulWidget {
  static const String MyHomePageRouteName = 'home';
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showFirebaseMenu = false;
  bool showProviderMenu = false;
  bool showHttpMenu = false;
  bool showGetMenu = false;
  bool showFlutterBasicMenu = false;
  bool showSingletonMenu = false;
  bool showTossPaymentMenu = false;
  bool showHiveMenu = false;

// DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
// AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
// print('Running on ${androidInfo.model}');  // e.g. "Moto G (4)"

// IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
// print('Running on ${iosInfo.utsname.machine}');  // e.g. "iPod7,1"

// WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
// print('Running on ${webBrowserInfo.userAgent}');  // e.g. "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:61.0) Gecko/20100101 Firefox/61.0"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      appBar: AppBar(
        title: const Text('Home Route'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _rectangleButton(
                onTap: () {
                  showFirebaseMenu = !showFirebaseMenu;
                  setState(() {});
                },
                color: Colors.blue,
                child: Image.network(
                    "https://firebase.google.com/images/brand-guidelines/logo-standard.png?hl=ko"),
              ),
              showFirebaseMenu
                  ? Column(
                      children: [
                        _routeButton(
                            context: context,
                            title: 'auth Login',
                            router: 'authPage')
                      ],
                    )
                  : const SizedBox(),
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
              _rectangleButton(
                onTap: () {
                  showProviderMenu = !showProviderMenu;
                  setState(() {});
                },
                color: const Color.fromARGB(255, 244, 109, 99),
                child: Text(
                  'Provider',
                  style: GoogleFonts.diplomata(
                      textStyle: Theme.of(context).textTheme.headline4,
                      color: Colors.white),
                ),
              ),
              showProviderMenu
                  ? Column(
                      children: [
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
                            router: 'shoppingCartProviderHome')
                      ],
                    )
                  : const SizedBox(),
              _rectangleButton(
                onTap: () {
                  showHttpMenu = !showHttpMenu;
                  setState(() {});
                },
                color: const Color.fromARGB(255, 132, 90, 228),
                child: Text(
                  'HTTPS & DIO',
                  style: GoogleFonts.aBeeZee(
                      textStyle: Theme.of(context).textTheme.headline4,
                      color: Colors.white),
                ),
              ),
              showHttpMenu
                  ? Column(
                      children: [
                        _routeButton(
                            context: context,
                            title: 'dio Sign-Up',
                            router: 'dioSignUpHome'),
                        _routeButton(
                            context: context,
                            title: 'DioTest',
                            router: 'dioTest'),
                        _routeButton(
                            context: context,
                            title: 'HttpCloneCoding',
                            router: 'httpCloneCoding'),
                        _routeButton(
                            context: context,
                            title: 'httpWeatherLoadingScreen',
                            router: 'httpWeatherLoadingScreenRouteName'),
                      ],
                    )
                  : const SizedBox(),
              _rectangleButton(
                  onTap: () {
                    showGetMenu = !showGetMenu;
                    setState(() {});
                  },
                  child: Text(
                    'GET-X',
                    style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.headline4,
                        color: Colors.white),
                  ),
                  color: Colors.amber),
              showGetMenu
                  ? Column(
                      children: [],
                    )
                  : const SizedBox(),
              _rectangleButton(
                onTap: () {
                  showFlutterBasicMenu = !showFlutterBasicMenu;
                  setState(() {});
                },
                child: Text(
                  'FlutterBasic',
                  style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.headline4,
                      color: Colors.white),
                ),
                color: const Color.fromARGB(255, 97, 64, 189),
              ),
              showFlutterBasicMenu
                  ? Column(children: [
                      _routeButton(
                          context: context,
                          title: 'Flutter Basic',
                          router: 'flutterBasic'),
                      _routeButton(
                          context: context,
                          title: 'Animation Practice',
                          router: 'animationPractice'),
                    ])
                  : const SizedBox(),
              _rectangleButton(
                onTap: () {
                  showSingletonMenu = !showSingletonMenu;
                  setState(() {});
                },
                child: Text(
                  'Singleton Pattern',
                  style: GoogleFonts.allison(
                      textStyle: Theme.of(context).textTheme.headline2,
                      color: Colors.white),
                ),
                color: Color.fromARGB(255, 103, 189, 117),
              ),
              showSingletonMenu
                  ? Column(children: [
                      _routeButton(
                          context: context,
                          title: 'Set singleton',
                          router: 'setSingletonScreen'),
                      _routeButton(
                          context: context,
                          title: 'Get singleton',
                          router: 'getSingletonScreen'),
                    ])
                  : const SizedBox(),
              _rectangleButton(
                onTap: () {
                  showTossPaymentMenu = !showTossPaymentMenu;
                  setState(() {});
                },
                child: Text(
                  'Toss Payment',
                  style: GoogleFonts.notoSansCanadianAboriginal(
                      textStyle: Theme.of(context).textTheme.headline4,
                      color: Colors.white),
                ),
                color: Color.fromARGB(255, 0, 30, 239),
              ),
              showTossPaymentMenu
                  ? Column(children: [
                      _routeButton(
                          context: context,
                          title: 'Toss Payment Test',
                          router: 'tossPaymentTestRouteName'),
                    ])
                  : const SizedBox(),
              _rectangleButton(
                onTap: () {
                  showHiveMenu = !showHiveMenu;
                  setState(() {});
                },
                child: Text(
                  'Hive Flutter',
                  style: GoogleFonts.lora(
                      textStyle: Theme.of(context).textTheme.headline4,
                      color: Colors.white),
                ),
                color: Color.fromARGB(255, 52, 88, 81),
              ),
              showHiveMenu
                  ? Column(children: [
                      _routeButton(
                          context: context,
                          title: 'Hive Flutter',
                          router: 'hivePageRouteName'),
                    ])
                  : const SizedBox(),
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
              margin: const EdgeInsets.symmetric(vertical: 5),
              height: 80,
              alignment: Alignment.center,
              color: color,
              child: child)),
    );
  }

  Widget _routeButton({required context, required title, required router}) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(4),
        child: Center(
            child: Text(
          title,
          style: const TextStyle(
            fontSize: 17,
          ),
          textAlign: TextAlign.center,
        )),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
              color: Colors.black38, style: BorderStyle.solid, width: 1),
        ),
        width: 300,
        height: 40,
      ),
      onTap: () {
        Navigator.pushNamed(context, router);
      },
    );
  }
}

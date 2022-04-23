import 'package:flutter/material.dart';
import 'package:my_practice_app/provider/shopping_cart_provider.dart';
import 'package:my_practice_app/screen/counter_provider_practice.dart';
import 'package:my_practice_app/provider/counter_provider.dart';
import 'package:my_practice_app/screen/http_clone_coding.dart';
import 'package:my_practice_app/screen/dio_sign_up.dart';
import 'package:my_practice_app/screen/dio_test.dart';
import 'package:my_practice_app/screen/http_weather_loading_screen.dart';
import 'package:my_practice_app/screen/http_weather_ui_screen.dart';
import 'package:my_practice_app/screen/no_provider.dart';
import 'package:my_practice_app/screen/shopping_cart_provider_home.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Counter()),
    ChangeNotifierProvider(create: (_) => ShoppingCart())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'my practice app',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        initialRoute: 'home',
        routes: {
          'home': (context) => MyHomePage(),
          'providerHome': (context) => ProviderHome(),
          'noProviderHome': (context) => NoProviderHome(),
          'shoppingCartProviderHome': (context) => ShoppingCartProviderHome(),
          'dioSignUpHome': (context) => DioSignUpHome(),
          'dioTest': (context) => DioTest(),
          'httpCloneCoding': (context) => HttpCloneCoding(),
          'httpWeatherLoadingScreenRouteName': (context) =>
              HttpWeatherLoadingScreen(),
          'httpWeatherUiScreenRouteName': (context) => HttpWeatherUiScreen(),
        });
  }
}

import 'package:flutter/material.dart';
import 'package:my_practice_app/widgets/too_lazy_to_make_appbar.dart';

class HttpWeatherUiScreen extends StatefulWidget {
  static String httpWeatherUiScreenRouteName = 'httpWeatherUiScreen';
  const HttpWeatherUiScreen({Key? key, this.parseWeatherData})
      : super(key: key);
  final dynamic parseWeatherData;

  @override
  State<HttpWeatherUiScreen> createState() => _WeatherUiScreenState();
}

class _WeatherUiScreenState extends State<HttpWeatherUiScreen> {
  late String cityName;
  late double temp;
  late int temp2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.parseWeatherData);
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData) {
    cityName = weatherData['name'];
    print(cityName);

    temp = weatherData['main']['temp'];
    temp2 = temp.round();
    print(temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              '$cityName',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '$temp2',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      )),
    );
  }
}

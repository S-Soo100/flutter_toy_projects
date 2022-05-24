import 'package:flutter/material.dart';
import 'package:my_practice_app/data/my_location.dart';
import 'package:my_practice_app/data/network_weather_data.dart';
import 'package:my_practice_app/screen/http/http_weather_ui_screen.dart';
import 'package:my_practice_app/widgets/too_lazy_to_make_appbar.dart';

const apikey = 'edf45a719af6304a635cc5c823140394';

class HttpWeatherLoadingScreen extends StatefulWidget {
  static String httpWeatherLoadingScreenRouteName = 'httpWeatherLoadingScreen';
  const HttpWeatherLoadingScreen({Key? key}) : super(key: key);

  @override
  State<HttpWeatherLoadingScreen> createState() =>
      _HttpWeatherLoadingScreenState();
}

class _HttpWeatherLoadingScreenState extends State<HttpWeatherLoadingScreen> {
  //! 처음 사용한 예시코드
  // var uri = Uri(
  //     scheme: 'https',
  //     host: 'samples.openweathermap.org',
  //     path: 'data/2.5/weather',
  //     queryParameters: {
  //       'q': 'London',
  //       'appid': 'b1b15e88fa797225412429c1c50c122a1'
  //     });

  late var latitude3;
  late var longitude3;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    var uri = Uri(
        scheme: 'https',
        host: 'api.openweathermap.org',
        path: 'data/2.5/weather',
        queryParameters: {
          'lat': '$latitude3',
          'lon': '$latitude3',
          'appid': '$apikey',
          'units': 'metric'
        });
    print(latitude3);
    print(longitude3);

    NetworkWeatherData networkWeatherData = NetworkWeatherData(uri);

    var weatherData = await networkWeatherData.getJsonData();
    print(weatherData);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HttpWeatherUiScreen(parseWeatherData: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          textColor: Colors.white,
          color: Colors.lightBlue[200],
          onPressed: () {
            getLocation();
          },
          child: const Text('Get My Location'),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_practice_app/data/my_location.dart';
import 'package:my_practice_app/data/network_weather_data.dart';
import 'package:my_practice_app/widgets/too_lazy_to_make_appbar.dart';

const apikey = 'edf45a719af6304a635cc5c823140394';

class HttpWeatherScreen extends StatefulWidget {
  static String httpWeatherScreenRouteName = 'httpWeatherScreen';
  const HttpWeatherScreen({Key? key}) : super(key: key);

  @override
  State<HttpWeatherScreen> createState() => _HttpWeatherScreenState();
}

class _HttpWeatherScreenState extends State<HttpWeatherScreen> {
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
        queryParameters: {'lat': latitude3, 'lon': latitude3, 'appid': apikey});
    print(latitude3);
    print(longitude3);

    NetworkWeatherData networkWeatherData = NetworkWeatherData(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TooLazyToMakeAppbar(context: context, title: 'weather&http'),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            getLocation();
          },
          child: const Text('Get My Location'),
        ),
      ),
    );
  }
}

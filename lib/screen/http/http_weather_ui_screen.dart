import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_practice_app/widgets/too_lazy_to_make_appbar.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

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
  var date = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    print(widget.parseWeatherData);
    updateData(widget.parseWeatherData);
    super.initState();
  }

  void updateData(dynamic weatherData) {
    cityName = weatherData['name'];
    print(cityName);

    temp = weatherData['main']['temp'];
    temp2 = temp.round();
    print(temp);
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.near_me,
              size: 30,
              color: Colors.white,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.location_searching,
                size: 30,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 150,
                            ),
                            Text('$cityName',
                                style: GoogleFonts.lato(
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            Row(
                              children: [
                                TimerBuilder.periodic(Duration(minutes: 1),
                                    builder: (context) {
                                  print('${getSystemTime()}');
                                  return Text(
                                    '${getSystemTime()}',
                                    style: GoogleFonts.lato(
                                        fontSize: 16.0, color: Colors.white),
                                  );
                                }),
                                Text(
                                  DateFormat(' - EEEE, ').format(date),
                                  style: GoogleFonts.lato(
                                      fontSize: 16.0, color: Colors.white),
                                ),
                                Text(
                                  DateFormat('d MMM, yyy').format(date),
                                  style: GoogleFonts.lato(
                                      fontSize: 16.0, color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${temp.round()}\u2103',
                              style: GoogleFonts.lato(
                                  fontSize: 85.0,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/Sun.svg',
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'clear sky',
                                  style: GoogleFonts.lato(
                                      fontSize: 16.0, color: Colors.white),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  //!마지막
                  Column(
                    children: [
                      Divider(
                        color: Colors.white30,
                        height: 15.0,
                        thickness: 2.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'AQI(대기질지수)',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0, color: Colors.white),
                              ),
                              SizedBox(height: 10),
                              Image.asset(
                                'assets/images/bad.png',
                                width: 37,
                                height: 35,
                              ),
                              SizedBox(height: 10),
                              Text(
                                '"매우나쁨"',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '미세먼지',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0, color: Colors.white),
                              ),
                              SizedBox(height: 10),
                              Image.asset(
                                'assets/images/bad.png',
                                width: 37,
                                height: 35,
                              ),
                              SizedBox(height: 10),
                              Text(
                                '"매우나쁨"',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '초미세먼지',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0, color: Colors.white),
                              ),
                              SizedBox(height: 10),
                              Image.asset(
                                'assets/images/bad.png',
                                width: 37,
                                height: 35,
                              ),
                              SizedBox(height: 10),
                              Text(
                                '"매우나쁨"',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

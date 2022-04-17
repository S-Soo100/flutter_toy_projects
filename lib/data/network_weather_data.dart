import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkWeatherData {
  var uri;
  NetworkWeatherData(this.uri);
  Future<dynamic> getJsonData() async {
    http.Response response = await http.get(uri);
    print(response.statusCode);

    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }
}

import 'dart:convert';

import 'models.dart';
import 'package:http/http.dart' as http;

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    //make call parameters
    final queryParameters = {
      'q': city,
      'appid': 'cce05479b5d12846681721d6774d1430',
      'units': 'imperial'
    };
    //Call  api
    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
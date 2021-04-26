import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_app/WeatherApp/model/weather_model.dart';
import 'package:weather_app/WeatherApp/utils/Forcast_Utils.dart';

class Network {
  Future<WeatherForecastModel> getWeatherForcast({String cityName}) async {
    var finalUrl = "http://api.openweathermap.org/data/2.5/forecast/daily?q=" +
        cityName +
        "&appid=" +
        Utils.appId +
        "&unit=imperial";

    /// change to metric or imperial

    final response = await get(Uri.encodeFull(finalUrl));

    print("Url : ${Uri.decodeFull(finalUrl)}");

    if (response.statusCode == 200) {
      return WeatherForecastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error getting data");
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:weather_app/WeatherApp/Convert_Icons.dart';
import 'package:weather_app/WeatherApp/utils/Forcast_Utils.dart';

import 'model/weather_model.dart';
import 'package:flutter/material.dart';

// ignore: missing_return
Widget forecastCards(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  var forCastList = snapshot.data.list;
  var dayOfWeek = "";
  var fullDate = Utils.getFormattedDate(
      new DateTime.fromMillisecondsSinceEpoch(forCastList[index].dt * 1000));
  dayOfWeek = fullDate.split(",")[0];
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Text(
          dayOfWeek,
          style: TextStyle(fontSize: 18),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
        child: Row(
          children: [
            CircleAvatar(
              radius: 31,
              backgroundColor: Colors.white,
              child: getWeatherIcon(
                  weatherDescription: forCastList[index].weather[0].main,
                  color: Colors.pinkAccent,
                  size: 38),
            ),
            Column(
              children: [
                Text("${forCastList[0].temp.max.toStringAsFixed(0)}°f"),
                Text("${forCastList[0].temp.min.toStringAsFixed(0)}°f"),
                Text("hum${forCastList[0].humidity}%"),
                Text("win${forCastList[0].speed.toStringAsFixed(0)}mi/h"),
              ],
            )
          ],
        ),
      )
    ],
  );
}

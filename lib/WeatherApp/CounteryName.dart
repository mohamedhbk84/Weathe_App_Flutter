import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/WeatherApp/utils/Forcast_Utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Convert_Icons.dart';
import 'model/weather_model.dart';

Widget midview(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forCastList = snapshot.data.list;
  var city = snapshot.data.city.name;
  var country = snapshot.data.city.country;
  Container midView = Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          // ignore: unnecessary_brace_in_string_interps
          "${city} , ${country}",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          "${Utils.getFormattedDate(new DateTime.fromMicrosecondsSinceEpoch(forCastList[0].dt * 1000))}",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 10,
        ),
        getWeatherIcon(
            weatherDescription: forCastList[0].weather[0].main,
            color: Colors.pinkAccent,
            size: 195),
        // Icon(
        //   FontAwesomeIcons.cloud,
        //   size: 195,
        //   color: Colors.amber.shade300,
        // ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${forCastList[0].temp.day.toStringAsFixed(0)}°f ",
                style: TextStyle(fontSize: 32),
              ),
              Text(
                "${forCastList[0].weather[0].description}",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("${forCastList[0].speed.toStringAsFixed(1)}  mi/h"),
                  Icon(FontAwesomeIcons.wind),
                  // Icon(Icons.speed),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    Text("${forCastList[0].humidity} %"),
                    Icon(FontAwesomeIcons.solidGrinBeam),
                  ],
                ),
              ),
              Column(
                children: [
                  Text("${forCastList[0].temp.max} "),
                  Icon(FontAwesomeIcons.temperatureHigh),
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
  return midView;
}

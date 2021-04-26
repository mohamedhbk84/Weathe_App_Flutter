import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/WeatherApp/Bottom_Card.dart';
import 'package:weather_app/WeatherApp/model/weather_model.dart';

// ignore: missing_return
Widget bottomView(
    AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context) {
  var forCastList = snapshot.data.list;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(" 7 - Day Weather For Cast"),
      Container(
        height: 190,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(
            width: 8,
          ),
          itemCount: forCastList.length,
          itemBuilder: (context, index) => ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
                width: MediaQuery.of(context).size.width / 2.4,
                height: 170,
                child: forecastCards(snapshot, index),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff9661ce), Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                )),
          ),
        ),
      ),
    ],
  );
}

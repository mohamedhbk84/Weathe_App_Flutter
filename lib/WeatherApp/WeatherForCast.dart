import 'package:flutter/material.dart';
import 'package:weather_app/WeatherApp/Bottom_View.dart';
import 'package:weather_app/WeatherApp/CounteryName.dart';
import 'package:weather_app/WeatherApp/Network/Network.dart';
import 'package:weather_app/WeatherApp/model/weather_model.dart';

class WeatherForCast extends StatefulWidget {
  @override
  _WeatherForCastState createState() => _WeatherForCastState();
}

class _WeatherForCastState extends State<WeatherForCast> {
  Future<WeatherForecastModel> forCastObject;
  String _cityName = "Egypt";
  @override
  void initState() {
    super.initState();

    forCastObject = Network().getWeatherForcast(cityName: _cityName);

    forCastObject.then((weather) => print(weather.city));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          textField(),
          Container(
            child: FutureBuilder<WeatherForecastModel>(
              future: forCastObject,
              builder: (BuildContext context,
                  AsyncSnapshot<WeatherForecastModel> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: midview(snapshot),
                      ),
                      bottomView(snapshot, context),
                    ],
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget textField() {
    return Container(
        child: TextField(
      decoration: InputDecoration(
        hintText: "Enter City Name",
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.all(10),
      ),
      onSubmitted: (value) {
        setState(() {
          _cityName = value;
          forCastObject = new Network().getWeatherForcast(cityName: _cityName);
        });
      },
    ));
  }
}

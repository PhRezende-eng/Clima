import 'package:flutter/material.dart';
import 'package:climadata/utilities/constants.dart';
import '../services/weather.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  LocationScreen({this.locationWeather});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();

  String weatherTemp;
  int tempo;
  String weatherIcon;
  String name;
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      double temperature = (weatherData['main']['temp'] - 273.15);
      var temp = temperature.toInt();
      var condition = weatherData['weather'][0]['id'];
      tempo = temperature.toInt();
      weatherTemp = weatherModel.getMessage(temp);
      weatherIcon = weatherModel.getWeatherIcon(condition);
      name = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    var dynamicSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MaterialButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$tempo°',
                      style: funcKTempTextStyle(dynamicSize.height * 0.1),
                      textAlign: TextAlign.start,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text(
                        '$weatherIcon',
                        style:
                            funcKConditionTextStyle(dynamicSize.height * 0.1),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  "$weatherTemp in $name!",
                  textAlign: TextAlign.center,
                  style: funcKMessageTextStyle(dynamicSize.height * 0.08),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

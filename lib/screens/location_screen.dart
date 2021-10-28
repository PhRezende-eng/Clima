import 'package:climadata/screens/city_screen.dart';
import 'package:climadata/screens/register_screen.dart';
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
  String cityName;
  @override
  void initState() {
    super.initState();
    // weatherModel = WeatherModel();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    // var weatherData = await weatherModel.getWeatherData();
    // await weatherModel.getWeatherData();
    setState(() {
      double temperature = (weatherData['main']['temp'] - 273.15);
      var temp = temperature.toInt();
      var condition = weatherData['weather'][0]['id'];
      tempo = temperature.toInt();
      weatherTemp = weatherModel.getMessage(temp);
      weatherIcon = weatherModel.getWeatherIcon(condition);
      name = weatherData['name'];
      // tempo = weatherModel.temp;
      // name = weatherModel.name;
      // weatherTemp = weatherModel.getMessage(tempo);
      // var condition = weatherModel.condition;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                    onPressed: () async {
                      var weatherData = await weatherModel.getWeatherData();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.account_box_rounded,
                      size: 50.0,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () async {
                      var cityName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CityScreen(),
                        ),
                      );
                      if (cityName != null) {
                        var getCityName = await weatherModel
                            .getWeatherLocation(cityName ?? '');
                        updateUI(getCityName);
                      }
                    },
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
                      style: funcKTempTextStyle(size.height * 0.1),
                      textAlign: TextAlign.start,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text(
                        '$weatherIcon',
                        style: funcKConditionTextStyle(size.height * 0.1),
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
                  style: funcKMessageTextStyle(size.height * 0.08),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

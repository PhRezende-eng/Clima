import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;

const apiKey = '4b567033eb2835b4087185083040ffde';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // void func() {
  //   setState(() {});
  // }

  // @override
  // void deactivate() {
  // ignore: todo
  //   // TODO: implement deactivate
  //   super.deactivate();
  // }
  var dataa;

  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    ClassLocation location = ClassLocation(); // --> objeto criado/instanciado
    await location.getCurrenteLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    print(latitude);
    print(longitude);
    getData();
  }

  void getData() async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    http.Response response = await http.get(url);
    dynamic data = response.body;
    int statusCode = response.statusCode;

    var decodedData = jsonDecode(data);
    dataa = decodedData;

    double temp = decodedData['main']['temp'];
    int condition = decodedData['weather'][0]['id'];
    String name = decodedData['name'];
    String weatherDescription = decodedData['weather'][0]['description'];

    print(weatherDescription);
    print(name);
    print(temp);
    print(condition);

    // if (response.statusCode == 200) {
    //   String data = response.body;
    //   print(data);
    // } else {
    //   print('ERROR! Esse foi o status code:${response.statusCode}');
    // }
    (response.statusCode == 200)
        ? print('------------------$data------------------')
        : print('ERROR! statusCode:$statusCode');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            // child: Text('${dataa['weather'][0]['description']}'),
            ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  dynamic data;
  @override
  void initState() {
    super.initState();
    getLocation();
    getData();
  }

  // void func() {
  //   setState(() {});
  // }

  // @override
  // void deactivate() {
  // ignore: todo
  //   // TODO: implement deactivate
  //   super.deactivate();
  // }

  void getLocation() async {
    ClassLocation location = ClassLocation(); // --> objeto criado/instanciado
    await location.getCurrenteLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=35&lon=139&appid=4b567033eb2835b4087185083040ffde');
    http.Response response = await http.get(url);
    String data = response.body;
    int statusCode = response.statusCode;
    // if (response.statusCode == 200) {
    //   String data = response.body;
    //   print(data);
    // } else {
    //   print('ERROR! Esse foi o status code:${response.statusCode}');
    // }
    (response.statusCode == 2)
        ? print(data)
        : print('ERROR! statusCode:$statusCode');
  }

  @override
  Widget build(BuildContext context) {
    // getData();
    return Scaffold();
  }
}

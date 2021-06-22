import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
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
    Location location = Location(); // --> objeto criado
    await location.getCurrenteLocation();
    print(location.latitude);
    print(location.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue)),
          onPressed: getLocation,
          child: Text('Get Location'),
        ),
      ),
    );
  }
}

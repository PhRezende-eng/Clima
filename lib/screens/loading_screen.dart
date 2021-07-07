import 'package:climadata/screens/location_screen.dart';
import 'package:climadata/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:climadata/services/location.dart';

const apiKey = '4b567033eb2835b4087185083040ffde';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // @override
  // void deactivate() {
  // ignore: todo
  //   // TODO: implement deactivate
  //   super.deactivate();
  // }
  var data;
  dynamic temp;
  dynamic condition;
  dynamic name;
  dynamic weatherDescription;
  bool isLoading = true;
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    ClassLocation location = ClassLocation(); // --> objeto criado/instanciado
    await location.getCurrenteLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    data = await networkHelper.getData();
    setState(() {
      isLoading = false;
    });

    temp = data['main']['temp'];
    condition = data['weather'][0]['id'];

    // ou

    name = networkHelper.name;
    weatherDescription = networkHelper.weatherDescription;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('temp:                  $temp'),
                  Text('condition:          $condition'),
                  Text('name:                 $name'),
                  Text('description:       $weatherDescription'),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LocationScreen();
                          },
                        ),
                      );
                    },
                    child: Text('Prosseguir'),
                  )
                ],
              ),
            ),
    );
  }
}

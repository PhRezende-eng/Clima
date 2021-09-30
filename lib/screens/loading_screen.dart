import 'package:climadata/screens/location_screen.dart';
import 'package:climadata/services/networking.dart';
import 'package:climadata/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:climadata/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
  // dynamic temp;
  // dynamic condition;
  // dynamic name;
  // dynamic weatherDescription;
  WeatherModel weatherModel;
  dynamic getWeatherData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    weatherModel = WeatherModel();
    getLocationData();
  }

  Future<void> getLocationData() async {
    // var data = await weatherModel.getWeatherData();

    getWeatherData = await weatherModel.getWeatherData();
    setState(() {
      isLoading = false;
    });

    // temp = (data['main']['temp'] - 273.15).toInt();
    // condition = data['weather'][0]['id'];
    // name = data['name'];
    // weatherDescription = data['weather'][0]['main'];

    // ou

    // name = weatherModel.name;
    // weatherDescription = weatherModel.weatherDescription;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: FutureBuilder(
      //   future: networkHelper.getData(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(
      //         child: SpinKitDoubleBounce(
      //           color: Colors.blue,
      //           size: 100.0,
      //         ),
      //       );
      //     } else if (snapshot.error != null) {
      //       return Center(
      //         child: Text('Ocorreu um erro'),
      //       );
      //     } else {
      //       return Center(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Text('temp:                  $temp'),
      //             Text('condition:          $condition'),
      //             Text('name:                 $name'),
      //             Text('description:       $weatherDescription'),
      //             ElevatedButton(
      //               child: Text('Prosseguir'),
      //               onPressed: () {
      //                 Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                     builder: (context) {
      //                       return LocationScreen();
      //                     },
      //                   ),
      //                 );
      //               },
      //             )
      //           ],
      //         ),
      //       );
      //     }
      //   },
      // ),
      body: isLoading
          ? Center(
              child: SpinKitDoubleBounce(
                color: Colors.blue,
                size: 100.0,
                duration: Duration(seconds: 3),
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('temp:                  ${weatherModel.temp}'),
                  Text('condition:          ${weatherModel.condition}'),
                  Text('name:                 ${weatherModel.name}'),
                  Text('description:       ${weatherModel.weatherDescription}'),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LocationScreen(
                              locationWeather: getWeatherData,
                            );
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

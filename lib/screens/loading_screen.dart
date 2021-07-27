import 'package:climadata/screens/location_screen.dart';
import 'package:climadata/services/networking.dart';
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
  dynamic data;
  dynamic temp;
  dynamic condition;
  dynamic name;
  NetworkHelper networkHelper;
  dynamic weatherDescription;
  bool isLoading = true;
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  Future<void> getLocationData() async {
    ClassLocation location = ClassLocation(); // --> objeto criado/instanciado
    await location.getCurrenteLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    networkHelper = await NetworkHelper(
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
      body: FutureBuilder(
        future: networkHelper.getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SpinKitDoubleBounce(
                color: Colors.blue,
                size: 100.0,
              ),
            );
          } else if (snapshot.error != null) {
            return Center(
              child: Text('Ocorreu um erro'),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('temp:                  $temp'),
                  Text('condition:          $condition'),
                  Text('name:                 $name'),
                  Text('description:       $weatherDescription'),
                  ElevatedButton(
                    child: Text('Prosseguir'),
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
                  )
                ],
              ),
            );
          }
        },
      ),
      // body: isLoading
      //     ? Center(
      //         child: SpinKitDoubleBounce(
      //           color: Colors.blue,
      //           size: 100.0,
      //           duration: Duration(seconds: 3),
      //         ),
      //       )
      //     : Center(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Text('temp:                  $temp'),
      //             Text('condition:          $condition'),
      //             Text('name:                 $name'),
      //             Text('description:       $weatherDescription'),
      //             ElevatedButton(
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
      //               child: Text('Prosseguir'),
      //             )
      //           ],
      //         ),
      //       ),
    );
  }
}

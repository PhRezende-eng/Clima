import 'package:geolocator/geolocator.dart';

class ClassLocation {
  double latitude; //propriedade da class que virá a ser objeto
  double longitude; //propriedade da class que virá a ser objeto

  Future<void> getCurrenteLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation,
      );

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print('*****************************$e');
    }
  }
}

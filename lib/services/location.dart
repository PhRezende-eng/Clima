import 'package:geolocator/geolocator.dart';

class Location {
  double latitude; //propiredade
  double longitude;

  Future<void> getCurrenteLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print('--$e');
    }
  }
}

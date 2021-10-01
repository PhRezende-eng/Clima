import 'package:climadata/services/location.dart';
import 'package:climadata/services/networking.dart';

const apiKey = '4b567033eb2835b4087185083040ffde';
const baseUrl = 'https://api.openweathermap.org/data/2.5';

class WeatherModel {
  int temp;
  int condition;
  String name;
  String weatherDescription;

  Future<dynamic> getWeatherData() async {
    ClassLocation location = ClassLocation(); // --> objeto criado/instanciado
    await location.getCurrenteLocation();

    // ignore: await_only_futures
    var networkHelper = await NetworkHelper(
        '$baseUrl/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey');
    print(networkHelper.condition); //null

    var data = await networkHelper.getData();

    print(networkHelper.condition); // depois de fazer o getData vem a resposta

    temp = (data['main']['temp'] - 273.15).toInt();
    condition = data['weather'][0]['id'];
    name = data['name'];
    weatherDescription = data['weather'][0]['main'];

    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

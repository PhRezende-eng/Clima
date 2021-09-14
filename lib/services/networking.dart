import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  String url;
  String uri;
  dynamic temp;
  dynamic condition;
  dynamic name;
  dynamic weatherDescription;

  NetworkHelper(this.uri);

  Future getData() async {
    var url = Uri.parse(uri);
    http.Response response = await http.get(url);

    var data = response.body;

    var decodedData = await jsonDecode(data);

    temp = decodedData['main']['temp'];
    condition = decodedData['weather'][0]['id'];
    name = decodedData['name'];
    weatherDescription = decodedData['weather'][0]['description'];

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print('ERROR! statusCode:${response.statusCode}');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:climadata/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  //cor do input
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  //função para cada mudança, parâmentro é o input
                  onChanged: (value) {
                    cityName = value;
                  },
                  decoration: funcKInputDecoration(
                    whichIcon: Icons.location_city,
                    hintText: 'Buscar o nome de uma cidade',
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  //retorna o context e em seguida faz o pop
                  // Navigator.of(context).pop(cityName);

                  //retorna o context junto com o pop
                  Navigator.pop(context, cityName);
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

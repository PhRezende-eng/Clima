import 'package:flutter/material.dart';

TextStyle funcKTempTextStyle(double fontSize) {
  return TextStyle(
    fontFamily: 'Spartan MB',
    fontSize: fontSize,
  );
}

TextStyle funcKMessageTextStyle(double fontSize) {
  return TextStyle(
    fontFamily: 'Spartan MB',
    fontSize: fontSize,
  );
}

TextStyle funcKConditionTextStyle(double fontSize) {
  return TextStyle(
    fontSize: fontSize,
  );
}

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const textInput = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Buscar o nome de uma cidade',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  icon: Icon(
    Icons.location_city,
  ),
  // border: InputBorder.none, // sem bordar
  border: OutlineInputBorder(
    // borderRadius: BorderRadius.circular(8),
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide.none, // sem bordar
  ),
);

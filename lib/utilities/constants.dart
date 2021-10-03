import 'package:flutter/material.dart';

InputDecoration funcKInputDecoration({
  String hintText,
  IconData whichIcon,
  bool hasIcon,
}) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white,
    hintText: hintText,
    hintStyle: TextStyle(
      color: Colors.grey,
    ),
    icon: Icon(
      whichIcon,
    ),
    // border: InputBorder.none, // sem bordar
    border: OutlineInputBorder(
      // borderRadius: BorderRadius.circular(8),
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide.none, // sem bordar
    ),
  );
}

// Container funKConfirmeButton() {
//   return Container(
//     width: double.infinity,
//     height: size.height * 0.12,
//     color: Colors.transparent,
//     child: GestureDetector(
//       onTap: () {},
//       child: Container(
//         margin: EdgeInsets.all(8),
//         alignment: Alignment.center,
//         child: Text(
//           'Confirmar',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           color: Colors.green[400],
//         ),
//       ),
//     ),
//   );
// }

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

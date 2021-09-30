import 'package:climadata/screens/loading_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClimaData',
      // theme: ThemeData.light(),
      theme: ThemeData.dark(), // --> dark mode

      home: LoadingScreen(),
    );
  }
}

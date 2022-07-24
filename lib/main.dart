import 'package:flutter/material.dart';
import 'package:covid_tracker/view/HomeScreen.dart';

void main() async {
  runApp(COVIDApp());
}

class COVIDApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: "Poppins",
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.black87)
          )),
      home: HomeScreen(),
    );
  }
}

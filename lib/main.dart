import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/weather_home_page.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black, brightness: Brightness.dark),
      home: const WeatherHomePage(),
    );
  }
}

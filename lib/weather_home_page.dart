import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/future_weather_forecast.dart';
import 'package:weather_app/realtime_weather.dart';
import 'package:weather_app/user_activity.dart';
import 'package:weather_app/weather_environment_details.dart';
import 'package:weather_app/weather_app_bar.dart';

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({super.key});

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  //List<Icons> wIcons = [Icons.CupertinoIcons.wind_snow];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays:
      [SystemUiOverlay.bottom],
      
  );
  SystemUiOverlayStyle(
        statusBarColor: Colors.grey[900]
      );
    return Scaffold(
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: CustomScrollView(
          slivers: [
            // Weather App Bar
            const WeatherAppBar(),
            // Realtime Weather
            const RealTimeWeather(),
            // Future Forceast Weather
            const FutureWeatherForecast(),
            // Weather Activity
            const WeatherEnvironmentDetails(),
            // UserActivity
            UserActivity(),
          ],
        ),
      ),
    );
  }
}

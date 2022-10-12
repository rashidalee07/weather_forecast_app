import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/hour_weather_data_model.dart';
import 'package:weather_icons/weather_icons.dart';

import 'data_constants.dart';
import 'fetch_data.dart';
import 'model/weather_data_model.dart';

class RealTimeWeather extends StatefulWidget {
  const RealTimeWeather({super.key});

  @override
  State<RealTimeWeather> createState() => _RealTimeWeatherState();
}

class _RealTimeWeatherState extends State<RealTimeWeather> {
  List<HourWeatherDataModel> hourWeatherListObjects = [];
  //late WeatherDataModel weatherDataModel;
  //late HourWeatherDataModel hourWeatherDataModel;

  // Map rm={};
  @override
  void initState() {
    weatherDataModel = WeatherDataModel();
    hourWeatherDataModel = HourWeatherDataModel();
    //  globalWeatherValues = WeatherDataModel();

    settingUpData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            color: Colors.grey[900],
            height: 290,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8,
                top: 8,
                right: 8,
              ),
              child: hourWeatherListObjects.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0, top: 16),
                          child: Row(children: [
                            const Icon(CupertinoIcons.location_solid),
                            Text(
                              weatherDataModel.cityName.toString(),
                              style: const TextStyle(fontSize: 24),
                            ),
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 4),
                          child: Text(convertDateFormat()),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                (weatherDataModel.isDay) == 1
                                    ? weatherDataModel.condition == 'Sunny'
                                        ? CupertinoIcons.sun_max_fill
                                        : weatherDataModel.condition == 'Haze'
                                            ? CupertinoIcons.sun_haze_fill
                                            : weatherDataModel.condition ==
                                                    'Smoke'
                                                ? CupertinoIcons.smoke_fill
                                                : weatherDataModel.condition ==
                                                        'Partly cloudy'
                                                    ? CupertinoIcons
                                                        .cloud_sun_fill
                                                    : weatherDataModel.condition ==
                                                            'Overcast'
                                                        ? CupertinoIcons
                                                            .cloud_fill
                                                        : weatherDataModel.condition ==
                                                                'Light rain'
                                                            ? CupertinoIcons
                                                                .cloud_rain_fill
                                                            : weatherDataModel.condition ==
                                                                    'Moderate rain'
                                                                ? CupertinoIcons
                                                                    .cloud_drizzle_fill
                                                                : weatherDataModel.condition ==
                                                                        'Heavy rain'
                                                                    ? CupertinoIcons
                                                                        .cloud_rain_fill
                                                                    : weatherDataModel.condition ==
                                                                            'Light rain shower'
                                                                        ? CupertinoIcons
                                                                            .cloud_drizzle_fill
                                                                        : weatherDataModel.condition ==
                                                                                'Light drizzle'
                                                                            ? CupertinoIcons
                                                                                .cloud_drizzle_fill
                                                                            : weatherDataModel.condition ==
                                                                                    'Moderate or heavy rain shower'
                                                                                ? CupertinoIcons
                                                                                    .cloud_drizzle_fill
                                                                                : weatherDataModel.condition ==
                                                                                        'Moderate or heavy rain shower with thunder'
                                                                                    ? CupertinoIcons
                                                                                        .cloud_bolt_rain_fill
                                                                                    : weatherDataModel.condition ==
                                                                                            'Fog'
                                                                                        ? CupertinoIcons
                                                                                            .cloud_fog_fill
                                                                                        : weatherDataModel.condition ==
                                                                                                'Thundery outbreaks possible'
                                                                                            ? CupertinoIcons
                                                                                                .cloud_bolt_fill
                                                                                            : null
                                    : weatherDataModel.condition == 'Clear'
                                        ? CupertinoIcons.moon_fill
                                        : weatherDataModel.condition ==
                                                'Partly cloudy'
                                            ? CupertinoIcons.cloud_moon_fill
                                            : weatherDataModel.condition ==
                                                    'Overcast'
                                                ? CupertinoIcons.cloud_fill
                                                : weatherDataModel.condition ==
                                                        'Light rain'
                                                    ? CupertinoIcons.cloud_rain
                                                    : weatherDataModel.condition ==
                                                            'Moderate rain'
                                                        ? CupertinoIcons
                                                            .cloud_drizzle_fill
                                                        : weatherDataModel.condition ==
                                                                'Heavy rain'
                                                            ? CupertinoIcons
                                                                .cloud_rain_fill
                                                            : weatherDataModel.condition ==
                                                                    'Light rain shower'
                                                                ? CupertinoIcons
                                                                    .cloud_drizzle_fill
                                                                : weatherDataModel.condition == 'Light drizzle'
                                                                    ? CupertinoIcons.cloud_drizzle_fill
                                                                    : weatherDataModel.condition == 'Moderate or heavy rain shower'
                                                                        ? CupertinoIcons.cloud_drizzle_fill
                                                                        : weatherDataModel.condition == 'Moderate or heavy rain shower with thunder'
                                                                            ? CupertinoIcons.cloud_bolt_rain_fill
                                                                            : weatherDataModel.condition == 'Fog'
                                                                                ? CupertinoIcons.cloud_fog_fill
                                                                                : weatherDataModel.condition == 'Thundery outbreaks possible'
                                                                                    ? CupertinoIcons.cloud_bolt
                                                                                    : null,
                                color: (weatherDataModel.isDay) == 1
                                    ? weatherDataModel.condition == 'Sunny'
                                        ? Colors.yellow
                                        : weatherDataModel.condition == 'Haze'
                                            ? Colors.yellow
                                            : weatherDataModel.condition ==
                                                    'Smoke'
                                                ? Colors.grey[300]
                                                : weatherDataModel.condition ==
                                                        'Partly cloudy'
                                                    ? Colors.grey[300]
                                                    : weatherDataModel
                                                                .condition ==
                                                            'Overcast'
                                                        ? Colors.grey[300]
                                                        : weatherDataModel
                                                                    .condition ==
                                                                'Light rain'
                                                            ? Colors.grey[300]
                                                            : weatherDataModel
                                                                        .condition ==
                                                                    'Moderate rain'
                                                                ? Colors
                                                                    .grey[300]
                                                                : weatherDataModel
                                                                            .condition ==
                                                                        'Heavy rain'
                                                                    ? Colors.grey[
                                                                        300]
                                                                    : weatherDataModel.condition ==
                                                                            'Light rain shower'
                                                                        ? Colors.grey[
                                                                            300]
                                                                        : weatherDataModel.condition ==
                                                                                'Light drizzle'
                                                                            ? Colors.grey[300]
                                                                            : weatherDataModel.condition == 'Moderate or heavy rain shower'
                                                                                ? Colors.grey[300]
                                                                                : weatherDataModel.condition == 'Moderate or heavy rain shower with thunder'
                                                                                    ? Colors.grey[300]
                                                                                    : weatherDataModel.condition == 'Fog'
                                                                                        ? Colors.grey[300]
                                                                                        : weatherDataModel.condition == 'Thundery outbreaks possible'
                                                                                            ? Colors.grey[300]
                                                                                            : null
                                    : weatherDataModel.condition == 'Clear'
                                        ? Colors.grey[300]
                                        : weatherDataModel.condition == 'Partly cloudy'
                                            ? Colors.grey[300]
                                            : weatherDataModel.condition == 'Overcast'
                                                ? Colors.grey[300]
                                                : weatherDataModel.condition == 'Light rain'
                                                    ? Colors.grey[300]
                                                    : weatherDataModel.condition == 'Moderate rain'
                                                        ? Colors.grey[300]
                                                        : weatherDataModel.condition == 'Heavy rain'
                                                            ? Colors.grey[300]
                                                            : weatherDataModel.condition == 'Light rain shower'
                                                                ? Colors.grey[300]
                                                                : weatherDataModel.condition == 'Light drizzle'
                                                                    ? Colors.grey[300]
                                                                    : weatherDataModel.condition == 'Moderate or heavy rain shower'
                                                                        ? Colors.grey[300]
                                                                        : weatherDataModel.condition == 'Moderate or heavy rain shower with thunder'
                                                                            ? Colors.grey[300]
                                                                            : weatherDataModel.condition == 'Fog'
                                                                                ? Colors.grey[300]
                                                                                : weatherDataModel.condition == 'Thundery outbreaks possible'
                                                                                    ? Colors.grey[300]
                                                                                    : null,
                                size: 40,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                weatherDataModel.temperature!
                                    .toInt()
                                    .toString(),
                                style: const TextStyle(fontSize: 40),
                              ),
                              SizedBox(
                                width: isPortrait ? 124 : 464,
                              ),
                              Column(
                                children: [
                                  Text(weatherDataModel.condition.toString()),
                                  Text(
                                      '${weatherDataModel.maxTemp!.toInt().toString()}/${weatherDataModel.minTemp!.toInt().toString()}'),
                                  Text(
                                      'Feels like ${weatherDataModel.feelsLike!.toInt().toString()}'),
                                ],
                              )
                            ],
                          ),
                        ),
                       const SizedBox(
                           height: 8,
                       ),
                        SizedBox(
                          height: 90,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: hourWeatherListObjects.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, right: 16),
                                    child: Column(
                                      children: [
                                        Text(
                                          hourWeatherListObjects[index]
                                              .timeEpoch
                                              .toString(),
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        // SizedBox(
                                        //   height:10
                                        // ),
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(top: 4.0),
                                            child: Icon(
                                              hourWeatherListObjects[index]
                                                          .isDay ==
                                                      1
                                                  ? hourWeatherListObjects[index]
                                                              .condition ==
                                                          'Sunny'
                                                      ? CupertinoIcons
                                                          .sun_max_fill
                                                      : hourWeatherListObjects[
                                                                      index]
                                                                  .condition ==
                                                              'Haze'
                                                          ? CupertinoIcons
                                                              .sun_haze_fill
                                                          : hourWeatherListObjects[
                                                                          index]
                                                                      .condition ==
                                                                  'Smoke'
                                                              ? CupertinoIcons
                                                                  .smoke_fill
                                                              : hourWeatherListObjects[
                                                                              index]
                                                                          .condition ==
                                                                      'Partly cloudy'
                                                                  ? CupertinoIcons
                                                                      .cloud_sun_fill
                                                                  : hourWeatherListObjects[index]
                                                                              .condition ==
                                                                          'Overcast'
                                                                      ? CupertinoIcons
                                                                          .cloud_fill
                                                                      : hourWeatherListObjects[index].condition ==
                                                                              'Light rain'
                                                                          ? CupertinoIcons
                                                                              .cloud_rain_fill
                                                                          : hourWeatherListObjects[index].condition == 'Moderate rain'
                                                                              ? CupertinoIcons.cloud_drizzle_fill
                                                                              : hourWeatherListObjects[index].condition == 'Heavy rain'
                                                                                  ? CupertinoIcons.cloud_rain_fill
                                                                                  : hourWeatherListObjects[index].condition == 'Light rain shower'
                                                                                      ? CupertinoIcons.cloud_drizzle_fill
                                                                                      : hourWeatherListObjects[index].condition == 'Light drizzle'
                                                                                          ? CupertinoIcons.cloud_drizzle_fill
                                                                                          : hourWeatherListObjects[index].condition == 'Moderate or heavy rain shower'
                                                                                              ? CupertinoIcons.cloud_drizzle_fill
                                                                                              : hourWeatherListObjects[index].condition == 'Moderate or heavy rain with thunder'
                                                                                                  ? CupertinoIcons.cloud_bolt_rain_fill
                                                                                                  : hourWeatherListObjects[index].condition == 'Fog'
                                                                                                      ? CupertinoIcons.cloud_fog_fill
                                                                                                      : hourWeatherListObjects[index].condition == 'Thundery outbreaks possible'
                                                                                                          ? CupertinoIcons.cloud_bolt_fill
                                                                                                          : CupertinoIcons.cloud_bolt_fill
                                                  : hourWeatherListObjects[index].condition == 'Clear'
                                                      ? CupertinoIcons.moon_fill
                                                      : hourWeatherListObjects[index].condition == 'Partly cloudy'
                                                          ? CupertinoIcons.cloud_moon_fill
                                                          : hourWeatherListObjects[index].condition == 'Overcast'
                                                              ? CupertinoIcons.cloud_fill
                                                              : hourWeatherListObjects[index].condition == 'Light rain'
                                                                  ? CupertinoIcons.cloud_rain_fill
                                                                  : hourWeatherListObjects[index].condition == 'Moderate rain'
                                                                      ? CupertinoIcons.cloud_drizzle_fill
                                                                      : hourWeatherListObjects[index].condition == 'Heavy rain'
                                                                          ? CupertinoIcons.cloud_rain_fill
                                                                          : hourWeatherListObjects[index].condition == 'Light rain shower'
                                                                              ? CupertinoIcons.cloud_drizzle_fill
                                                                              : hourWeatherListObjects[index].condition == 'Light drizzle'
                                                                                  ? CupertinoIcons.cloud_drizzle_fill
                                                                                  : hourWeatherListObjects[index].condition == 'Moderate or heavy rain shower'
                                                                                      ? CupertinoIcons.cloud_drizzle_fill
                                                                                      : hourWeatherListObjects[index].condition == 'Moderate or heavy rain with thunder'
                                                                                          ? CupertinoIcons.cloud_bolt_rain_fill
                                                                                          : hourWeatherListObjects[index].condition == 'Fog'
                                                                                              ? CupertinoIcons.cloud_fog_fill
                                                                                              : hourWeatherListObjects[index].condition == 'Thundery outbreaks possible'
                                                                                                  ? CupertinoIcons.cloud_bolt_fill
                                                                                                  : null,
                                              color: hourWeatherListObjects[index]
                                                          .isDay ==
                                                      1
                                                  ? hourWeatherListObjects[index]
                                                              .condition ==
                                                          'Sunny'
                                                      ? Colors.yellow
                                                      : hourWeatherListObjects[
                                                                      index]
                                                                  .condition ==
                                                              'Haze'
                                                          ? Colors.yellow
                                                          : hourWeatherListObjects[
                                                                          index]
                                                                      .condition ==
                                                                  'Smoke'
                                                              ? Colors.grey[300]
                                                              : hourWeatherListObjects[
                                                                              index]
                                                                          .condition ==
                                                                      'Partly cloudy'
                                                                  ?  Colors.grey[300]
                                                                  : hourWeatherListObjects[index]
                                                                              .condition ==
                                                                          'Overcast'
                                                                      ?  Colors.grey[300]
                                                                      : hourWeatherListObjects[index].condition ==
                                                                              'Light rain'
                                                                          ?  Colors.grey[300]
                                                                          : hourWeatherListObjects[index].condition == 'Moderate rain'
                                                                              ?  Colors.grey[300]
                                                                              : hourWeatherListObjects[index].condition == 'Heavy rain'
                                                                                  ?  Colors.grey[300]
                                                                                  : hourWeatherListObjects[index].condition == 'Light rain shower'
                                                                                      ?  Colors.grey[300]
                                                                                      : hourWeatherListObjects[index].condition == 'Light drizzle'
                                                                                          ?  Colors.grey[300]
                                                                                          : hourWeatherListObjects[index].condition == 'Moderate or heavy rain shower'
                                                                                              ?  Colors.grey[300]
                                                                                              : hourWeatherListObjects[index].condition == 'Moderate or heavy rain shower with thunder'
                                                                                                  ?  Colors.grey[300]
                                                                                                  : hourWeatherListObjects[index].condition == 'Fog'
                                                                                                      ?  Colors.grey[300]
                                                                                                      : hourWeatherListObjects[index].condition == 'Thundery outbreaks possible'
                                                                                                          ?  Colors.grey[300]
                                                                                                          :  Colors.grey[300]
                                                  : hourWeatherListObjects[index].condition == 'Clear'
                                                      ?  Colors.grey[300]
                                                      : hourWeatherListObjects[index].condition == 'Partly cloudy'
                                                          ?  Colors.grey[300]
                                                          : hourWeatherListObjects[index].condition == 'Overcast'
                                                              ?  Colors.grey[300]
                                                              : hourWeatherListObjects[index].condition == 'Light rain'
                                                                  ?  Colors.grey[300]
                                                                  : hourWeatherListObjects[index].condition == 'Moderate rain'
                                                                      ?  Colors.grey[300]
                                                                      : hourWeatherListObjects[index].condition == 'Heavy rain'
                                                                          ?  Colors.grey[300]
                                                                          : hourWeatherListObjects[index].condition == 'Light rain shower'
                                                                              ?  Colors.grey[300]
                                                                              : hourWeatherListObjects[index].condition == 'Light drizzle'
                                                                                  ?  Colors.grey[300]
                                                                                  : hourWeatherListObjects[index].condition == 'Moderate or heavy rain shower'
                                                                                      ?  Colors.grey[300]
                                                                                      : hourWeatherListObjects[index].condition == 'Moderate or heavy rain with thunder'
                                                                                          ?  Colors.grey[300]
                                                                                          : hourWeatherListObjects[index].condition == 'Fog'
                                                                                              ?  Colors.grey[300]
                                                                                              : hourWeatherListObjects[index].condition == 'Thundery outbreaks possible'
                                                                                                  ?  Colors.grey[300]
                                                                                                  : null,
                                            )),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4.0),
                                          child: Text(
                                            hourWeatherListObjects[index]
                                                .temperature!
                                                .toInt()
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 16,
                                          child: Row(
                                            children: [
                                              const Icon(
                                                CupertinoIcons.drop,
                                                size: 12,
                                              ),
                                              Text(
                                                  ' ${hourWeatherListObjects[index].willItRain.toString()}%')
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Center(
                          child: SizedBox(
                              width: 104,
                              height: 28,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    //  maximumSize: MaterialStateProperty.all(const Size(4, 4)),
                                    // maximumSize: MaterialStateProperty.all(const Size(24, 0)),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.grey[800]),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32)))),
                                onPressed: () {},
                                child: const Text('More',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    )),
                              )),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  String convertDateFormat() {
    List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    List<String> months = [
      'January',
      'Februray',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    String myDate = days[(DateTime.now().weekday) - 1];
    myDate = '$myDate' ' ' '${DateTime.now().day}';
    myDate = '$myDate' ' ' '${months[(DateTime.now().month) - 1]}';
    String time = DateFormat.jm().format(DateTime.now()).toString();
    myDate = '$myDate' ' ' '$time';
    return myDate;
  }

  settingUpData() async {
    Future<Map> rpm = apiCall();
    Map rm = await rpm;

    weatherDataModel = weatherDataModel.fromJson(rm);
    // globalWeatherValues=weatherDataModel;
    hourWeatherListObjects = hourWeatherDataModel.fromJson(rm);
    print(hourWeatherListObjects[0].isDay);
    print(hourWeatherListObjects[9].isDay);
    //print(globalWeatherValues.uv);
    setState(() {});
  }
}

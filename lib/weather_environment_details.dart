import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/environment_row.dart';
import 'package:weather_app/model/weather_data_model.dart';

import 'data_constants.dart';
import 'fetch_data.dart';
import 'item_divider.dart';

class WeatherEnvironmentDetails extends StatefulWidget {
  const WeatherEnvironmentDetails({super.key});

  @override
  State<WeatherEnvironmentDetails> createState() =>
      _WeatherEnvironmentDetailsState();
}

class _WeatherEnvironmentDetailsState extends State<WeatherEnvironmentDetails> {
  List<String> weatherTerms = [
    'UV index',
    'Sunrise',
    'Sunset',
    'Wind',
    'AQI',
    'Humidity'
  ];
  

  
  @override
  void initState() {
    settingUpData();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return SliverToBoxAdapter(
        child: Padding(
            padding: const EdgeInsets.all(4),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                    height: 360,
                    color: Colors.grey[900],
                    child: Padding(
                        padding: const EdgeInsets.only(left:4, top:16,right: 4),
                        child: SizedBox(
                            height: 260,
                            child: Column(
                              children: [
                                EnvironmentItems(
                                  itemIcons: Icons.wb_twighlight,
                                  itemName: weatherTerms[0],
                                  itemValue: weatherDataModel.uv.toString(),
                                  color: Colors.yellow
                                  
                                  
                                  
                                ),
                               const ItemDivider(),

                               EnvironmentItems(
                                  itemIcons: CupertinoIcons.sunrise_fill,
                                  itemName: weatherTerms[1],
                                  itemValue: '  ${weatherDataModel.sunRiseTime.toString()}',
                                  color: Colors.yellow
                                  
                                ),
                               const ItemDivider(),

                               EnvironmentItems(
                                  itemIcons: CupertinoIcons.sunset_fill,
                                  itemName: weatherTerms[2],
                                  itemValue:'  ${weatherDataModel.sunSetTime.toString()}',
                                  color: Colors.yellow[700],
                                  
                                ),
                               const ItemDivider(),

                               EnvironmentItems(
                                  itemIcons: CupertinoIcons.wind,
                                  itemName: weatherTerms[3],
                                  itemValue: '${weatherDataModel.windSpeed.toString()} k/mh',
                                   color: Colors.grey,
                                ),
                               const ItemDivider(),

                               EnvironmentItems(
                                  itemIcons: CupertinoIcons.wind_snow,
                                  itemName: weatherTerms[4],
                                  itemValue: weatherDataModel.aqi.toString(),
                                  color: Colors.grey,
                                ),
                               const ItemDivider(),

                               EnvironmentItems(
                                  itemIcons: CupertinoIcons.drop_fill,
                                  itemName: weatherTerms[5],
                                  itemValue: '${weatherDataModel.humidity.toString()}%',
                                  color: Colors.lightBlueAccent[100],
                                ),
                               const ItemDivider(), 
                               
                              ],
                            )))))));
  }

  settingUpData() async {
    Future<Map> rpm = apiCall();
    Map rm = await rpm;

    weatherDataModel = weatherDataModel.fromJson(rm);
    // globalWeatherValues=weatherDataModel;
    // hourWeatherListObjects = hourWeatherDataModel.fromJson(rm);
    //print(globalWeatherValues.uv);
    setState(() {});
  }
}

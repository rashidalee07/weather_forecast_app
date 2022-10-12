
import 'model/hour_weather_data_model.dart';
import 'model/weather_data_model.dart';

 //late WeatherDataModel globalWeatherValues;  

 WeatherDataModel weatherDataModel = WeatherDataModel(); 
  late HourWeatherDataModel hourWeatherDataModel;
  //
  ////////////////////////////////////////////////////////////////////////////////////
  

  // Icon(
  //                               (weatherDataModel.isDay) == 1
  //                                   ? weatherDataModel.condition == 'Sunny'
  //                                       ? CupertinoIcons.sun_max_fill
  //                                       : weatherDataModel.condition == 'Haze'
  //                                           ? CupertinoIcons.sun_haze_fill
  //                                           : weatherDataModel.condition ==
  //                                                   'Smoke'
  //                                               ? CupertinoIcons.smoke_fill
  //                                               : weatherDataModel.condition ==
  //                                                       'Partly cloudy'
  //                                                   ? CupertinoIcons.cloud_sun
  //                                                   : weatherDataModel.condition ==
  //                                                           'Overcast'
  //                                                       ? CupertinoIcons.cloud
  //                                                       : weatherDataModel.condition ==
  //                                                               'Light rain'
  //                                                           ? CupertinoIcons
  //                                                               .cloud_rain
  //                                                           : weatherDataModel.condition ==
  //                                                                   'Moderate rain'
  //                                                               ? CupertinoIcons
  //                                                                   .cloud_drizzle_fill
  //                                                               : weatherDataModel.condition ==
  //                                                                       'Heavy rain'
  //                                                                   ? CupertinoIcons
  //                                                                       .cloud_rain
  //                                                                   : weatherDataModel.condition ==
  //                                                                           'Light rain shower'
  //                                                                       ? CupertinoIcons
  //                                                                           .cloud_drizzle_fill
  //                                                                       : weatherDataModel.condition ==
  //                                                                               'Light drizzle'
  //                                                                           ? CupertinoIcons
  //                                                                               .cloud_drizzle_fill
  //                                                                           : weatherDataModel.condition ==
  //                                                                                   'Moderate or heavy rain shower'
  //                                                                               ? CupertinoIcons
  //                                                                                   .cloud_drizzle_fill
  //                                                                               : weatherDataModel.condition ==
  //                                                                                       'Moderate or heavy rain shower with thunder'
  //                                                                                   ? CupertinoIcons
  //                                                                                       .cloud_bolt_rain_fill
  //                                                                                   : weatherDataModel.condition ==
  //                                                                                           'Fog'
  //                                                                                       ? CupertinoIcons
  //                                                                                           .cloud_fog_fill
  //                                                                                       : weatherDataModel.condition ==
  //                                                                                               'Thundery outbreaks possible'
  //                                                                                           ? CupertinoIcons
  //                                                                                               .cloud_bolt
  //                                                                                           : null
  //                                   : weatherDataModel.condition == 'Clear'
  //                                       ? CupertinoIcons.moon_fill
  //                                       : weatherDataModel.condition ==
  //                                               'Partly cloudy'
  //                                           ? CupertinoIcons.cloud_moon
  //                                           : weatherDataModel.condition ==
  //                                                   'Overcast'
  //                                               ? CupertinoIcons.cloud
  //                                               : weatherDataModel.condition ==
  //                                                       'Light rain'
  //                                                   ? CupertinoIcons.cloud_rain
  //                                                   : weatherDataModel.condition ==
  //                                                           'Moderate rain'
  //                                                       ? CupertinoIcons
  //                                                           .cloud_drizzle_fill
  //                                                       : weatherDataModel.condition ==
  //                                                               'Heavy rain'
  //                                                           ? CupertinoIcons
  //                                                               .cloud_rain
  //                                                           : weatherDataModel.condition ==
  //                                                                   'Light rain shower'
  //                                                               ? CupertinoIcons
  //                                                                   .cloud_drizzle_fill
  //                                                               : weatherDataModel.condition == 'Light drizzle'
  //                                                                   ? CupertinoIcons.cloud_drizzle_fill
  //                                                                   : weatherDataModel.condition == 'Moderate or heavy rain shower'
  //                                                                       ? CupertinoIcons.cloud_drizzle_fill
  //                                                                       : weatherDataModel.condition == 'Moderate or heavy rain shower with thunder'
  //                                                                           ? CupertinoIcons.cloud_bolt_rain_fill
  //                                                                           : weatherDataModel.condition == 'Fog'
  //                                                                               ? CupertinoIcons.cloud_fog_fill
  //                                                                               : weatherDataModel.condition == 'Thundery outbreaks possible'
  //                                                                                   ? CupertinoIcons.cloud_bolt
  //                                                                                   : null,
  //                               color: (weatherDataModel.isDay) == 1
  //                                   ? weatherDataModel.condition == 'Sunny'
  //                                       ? Colors.yellow
  //                                       : weatherDataModel.condition == 'Haze'
  //                                           ? Colors.yellow
  //                                           : weatherDataModel.condition ==
  //                                                   'Smoke'
  //                                               ? Colors.grey[300]
  //                                               : weatherDataModel.condition ==
  //                                                       'Partly cloudy'
  //                                                   ? Colors.grey[300]
  //                                                   : weatherDataModel
  //                                                               .condition ==
  //                                                           'Overcast'
  //                                                       ? Colors.grey[300]
  //                                                       : weatherDataModel
  //                                                                   .condition ==
  //                                                               'Light rain'
  //                                                           ? Colors.grey[300]
  //                                                           : weatherDataModel
  //                                                                       .condition ==
  //                                                                   'Moderate rain'
  //                                                               ? Colors
  //                                                                   .grey[300]
  //                                                               : weatherDataModel
  //                                                                           .condition ==
  //                                                                       'Heavy rain'
  //                                                                   ? Colors.grey[
  //                                                                       300]
  //                                                                   : weatherDataModel.condition ==
  //                                                                           'Light rain shower'
  //                                                                       ? Colors.grey[
  //                                                                           300]
  //                                                                       : weatherDataModel.condition ==
  //                                                                               'Light drizzle'
  //                                                                           ? Colors.grey[300]
  //                                                                           : weatherDataModel.condition == 'Moderate or heavy rain shower'
  //                                                                               ? Colors.grey[300]
  //                                                                               : weatherDataModel.condition == 'Moderate or heavy rain shower with thunder'
  //                                                                                   ? Colors.grey[300]
  //                                                                                   : weatherDataModel.condition == 'Fog'
  //                                                                                       ? Colors.grey[300]
  //                                                                                       : weatherDataModel.condition == 'Thundery outbreaks possible'
  //                                                                                           ? Colors.grey[300]
  //                                                                                           : null
  //                                   : weatherDataModel.condition == 'Clear'
  //                                       ? Colors.grey[300]
  //                                       : weatherDataModel.condition == 'Partly cloudy'
  //                                           ? Colors.grey[300]
  //                                           : weatherDataModel.condition == 'Overcast'
  //                                               ? Colors.grey[300]
  //                                               : weatherDataModel.condition == 'Light rain'
  //                                                   ? Colors.grey[300]
  //                                                   : weatherDataModel.condition == 'Moderate rain'
  //                                                       ? Colors.grey[300]
  //                                                       : weatherDataModel.condition == 'Heavy rain'
  //                                                           ? Colors.grey[300]
  //                                                           : weatherDataModel.condition == 'Light rain shower'
  //                                                               ? Colors.grey[300]
  //                                                               : weatherDataModel.condition == 'Light drizzle'
  //                                                                   ? Colors.grey[300]
  //                                                                   : weatherDataModel.condition == 'Moderate or heavy rain shower'
  //                                                                       ? Colors.grey[300]
  //                                                                       : weatherDataModel.condition == 'Moderate or heavy rain shower with thunder'
  //                                                                           ? Colors.grey[300]
  //                                                                           : weatherDataModel.condition == 'Fog'
  //                                                                               ? Colors.grey[300]
  //                                                                               : weatherDataModel.condition == 'Thundery outbreaks possible'
  //                                                                                   ? Colors.grey[300]
  //                                                                                   : null,
  //                               size: 40,
  //                             )






  /////////////////////
  // ] Icon(
  //                                             hourWeatherListObjects[index]
  //                                                         .isDay ==
  //                                                     1
  //                                                 ? weatherDataModel
  //                                                             .condition ==
  //                                                         'Sunny'
  //                                                     ? CupertinoIcons
  //                                                         .sun_max_fill
  //                                                     : weatherDataModel
  //                                                                 .condition ==
  //                                                             'Haze'
  //                                                         ? CupertinoIcons
  //                                                             .sun_haze_fill
  //                                                         : weatherDataModel
  //                                                                     .condition ==
  //                                                                 'Smoke'
  //                                                             ? CupertinoIcons
  //                                                                 .smoke_fill
  //                                                             : weatherDataModel
  //                                                                         .condition ==
  //                                                                     'Partly cloudy'
  //                                                                 ? CupertinoIcons
  //                                                                     .cloud_sun
  //                                                                 : weatherDataModel
  //                                                                             .condition ==
  //                                                                         'Overcast'
  //                                                                     ? CupertinoIcons
  //                                                                         .cloud
  //                                                                     : weatherDataModel.condition ==
  //                                                                             'Light rain'
  //                                                                         ? CupertinoIcons
  //                                                                             .cloud_rain
  //                                                                         : weatherDataModel.condition == 'Moderate rain'
  //                                                                             ? CupertinoIcons.cloud_drizzle_fill
  //                                                                             : weatherDataModel.condition == 'Heavy rain'
  //                                                                                 ? CupertinoIcons.cloud_rain
  //                                                                                 : weatherDataModel.condition == 'Light rain shower'
  //                                                                                     ? CupertinoIcons.cloud_drizzle_fill
  //                                                                                     : weatherDataModel.condition == 'Light drizzle'
  //                                                                                         ? CupertinoIcons.cloud_drizzle_fill
  //                                                                                         : weatherDataModel.condition == 'Moderate or heavy rain shower'
  //                                                                                             ? CupertinoIcons.cloud_drizzle_fill
  //                                                                                             : weatherDataModel.condition == 'Moderate or heavy rain shower with thunder'
  //                                                                                                 ? CupertinoIcons.cloud_bolt_rain_fill
  //                                                                                                 : weatherDataModel.condition == 'Fog'
  //                                                                                                     ? CupertinoIcons.cloud_fog_fill
  //                                                                                                     : weatherDataModel.condition == 'Thundery outbreaks possible'
  //                                                                                                         ? CupertinoIcons.cloud_bolt
  //                                                                                                         : null
  //                                                 : weatherDataModel.condition == 'Clear'
  //                                                     ? CupertinoIcons.moon_fill
  //                                                     : weatherDataModel.condition == 'Partly cloudy'
  //                                                         ? CupertinoIcons.cloud_moon
  //                                                         : weatherDataModel.condition == 'Overcast'
  //                                                             ? CupertinoIcons.cloud
  //                                                             : weatherDataModel.condition == 'Light rain'
  //                                                                 ? CupertinoIcons.cloud_rain
  //                                                                 : weatherDataModel.condition == 'Moderate rain'
  //                                                                     ? CupertinoIcons.cloud_drizzle_fill
  //                                                                     : weatherDataModel.condition == 'Heavy rain'
  //                                                                         ? CupertinoIcons.cloud_rain
  //                                                                         : weatherDataModel.condition == 'Light rain shower'
  //                                                                             ? CupertinoIcons.cloud_drizzle_fill
  //                                                                             : weatherDataModel.condition == 'Light drizzle'
  //                                                                                 ? CupertinoIcons.cloud_drizzle_fill
  //                                                                                 : weatherDataModel.condition == 'Moderate or heavy rain shower'
  //                                                                                     ? CupertinoIcons.cloud_drizzle_fill
  //                                                                                     : weatherDataModel.condition == 'Moderate or heavy rain shower with thunder'
  //                                                                                         ? CupertinoIcons.cloud_bolt_rain_fill
  //                                                                                         : weatherDataModel.condition == 'Fog'
  //                                                                                             ? CupertinoIcons.cloud_fog_fill
  //                                                                                             : weatherDataModel.condition == 'Thundery outbreaks possible'
  //                                                                                                 ? CupertinoIcons.cloud_bolt
  //                                                                                                 : null,
  //                                             color: (weatherDataModel.isDay) ==
  //                                                     1
  //                                                 ? weatherDataModel
  //                                                             .condition ==
  //                                                         'Sunny'
  //                                                     ? Colors.yellow
  //                                                     : weatherDataModel
  //                                                                 .condition ==
  //                                                             'Haze'
  //                                                         ? Colors.yellow
  //                                                         : weatherDataModel
  //                                                                     .condition ==
  //                                                                 'Smoke'
  //                                                             ? Colors.grey[300]
  //                                                             : weatherDataModel
  //                                                                         .condition ==
  //                                                                     'Partly cloudy'
  //                                                                 ? Colors
  //                                                                     .grey[300]
  //                                                                 : weatherDataModel
  //                                                                             .condition ==
  //                                                                         'Overcast'
  //                                                                     ? Colors.grey[
  //                                                                         300]
  //                                                                     : weatherDataModel.condition ==
  //                                                                             'Light rain'
  //                                                                         ? Colors
  //                                                                             .grey[300]
  //                                                                         : weatherDataModel.condition == 'Moderate rain'
  //                                                                             ? Colors.grey[300]
  //                                                                             : weatherDataModel.condition == 'Heavy rain'
  //                                                                                 ? Colors.grey[300]
  //                                                                                 : weatherDataModel.condition == 'Light rain shower'
  //                                                                                     ? Colors.grey[300]
  //                                                                                     : weatherDataModel.condition == 'Light drizzle'
  //                                                                                         ? Colors.grey[300]
  //                                                                                         : weatherDataModel.condition == 'Moderate or heavy rain shower'
  //                                                                                             ? Colors.grey[300]
  //                                                                                             : weatherDataModel.condition == 'Moderate or heavy rain shower with thunder'
  //                                                                                                 ? Colors.grey[300]
  //                                                                                                 : weatherDataModel.condition == 'Fog'
  //                                                                                                     ? Colors.grey[300]
  //                                                                                                     : weatherDataModel.condition == 'Thundery outbreaks possible'
  //                                                                                                         ? Colors.grey[300]
  //                                                                                                         : null
  //                                                 : weatherDataModel.condition == 'Clear'
  //                                                     ? Colors.grey[300]
  //                                                     : weatherDataModel.condition == 'Partly cloudy'
  //                                                         ? Colors.grey[300]
  //                                                         : weatherDataModel.condition == 'Overcast'
  //                                                             ? Colors.grey[300]
  //                                                             : weatherDataModel.condition == 'Light rain'
  //                                                                 ? Colors.grey[300]
  //                                                                 : weatherDataModel.condition == 'Moderate rain'
  //                                                                     ? Colors.grey[300]
  //                                                                     : weatherDataModel.condition == 'Heavy rain'
  //                                                                         ? Colors.grey[300]
  //                                                                         : weatherDataModel.condition == 'Light rain shower'
  //                                                                             ? Colors.grey[300]
  //                                                                             : weatherDataModel.condition == 'Light drizzle'
  //                                                                                 ? Colors.grey[300]
  //                                                                                 : weatherDataModel.condition == 'Moderate or heavy rain shower'
  //                                                                                     ? Colors.grey[300]
  //                                                                                     : weatherDataModel.condition == 'Moderate or heavy rain shower with thunder'
  //                                                                                         ? Colors.grey[300]
  //                                                                                         : weatherDataModel.condition == 'Fog'
  //                                                                                             ? Colors.grey[300]
  //                                                                                             : weatherDataModel.condition == 'Thundery outbreaks possible'
  //                                                                                                 ? Colors.grey[300]
  //                                                                                                 : null,
  //                                           )
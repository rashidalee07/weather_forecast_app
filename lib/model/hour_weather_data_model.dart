import 'package:intl/intl.dart';

class HourWeatherDataModel {
  String? timeEpoch;
  double? temperature;
  int? isDay;
  int? willItRain;
  String? condition;
  List<HourWeatherDataModel> totalHourWeatherList = [];
  List<HourWeatherDataModel> hourWeatherList = [];

  HourWeatherDataModel([
    this.timeEpoch,
    this.temperature,
    this.isDay,
    this.willItRain,
    this.condition,
  ]);

   fromJson(Map recievedMap) {
    //int hours = recievedMap['forecast']['forecastday'][0]['hour'].length;
    //int hours = 24;
    int daysCounter = 0;
    int totalDays = 3;
    int i;
    for (i = 0; daysCounter < totalDays; i++) {
      if (i < 24) {
        int timeStamp = (recievedMap['forecast']['forecastday'][daysCounter]
                ['hour'][i]['time_epoch']) ;
          timeStamp =timeStamp*1000;
        String hourTime = DateFormat.j()
            .format(DateTime.fromMillisecondsSinceEpoch(timeStamp));

        HourWeatherDataModel hourWeatherDataModel = HourWeatherDataModel(
          timeEpoch = hourTime,
          temperature = recievedMap['forecast']['forecastday'][daysCounter]
              ['hour'][i]['temp_c'],
          isDay = recievedMap['forecast']['forecastday'][daysCounter]['hour'][i]
              ['is_day'],
          willItRain = recievedMap['forecast']['forecastday'][daysCounter]
              ['hour'][i]['will_it_rain'],
          condition = recievedMap['forecast']['forecastday'][daysCounter]
              ['hour'][i]['condition']['text'],
        );

        totalHourWeatherList.add(hourWeatherDataModel);
      } else if (i == 24 && daysCounter < totalDays) {
        daysCounter++;
        i = -1;
        //totalHourWeatherList.add(hourWeatherDataModel);
      }
    }

     hourWeatherList = _updateWeatherHours();
     return hourWeatherList;
  }

  List<HourWeatherDataModel> _updateWeatherHours() {
    List<HourWeatherDataModel> hourWeather=[];
    //print(totalHourWeatherList.length);
    int timeFoundIndex = 0;
    int newListIndex = 0;
    String currentHour = (DateFormat.j().format(
        DateTime.fromMillisecondsSinceEpoch(
            DateTime.now().toUtc().millisecondsSinceEpoch)));
    for (int i = 0; i < 24; i++) {
      if (totalHourWeatherList[i].timeEpoch == currentHour) {
        timeFoundIndex = i;
        break;
      }
    }

    for (int j = timeFoundIndex; j < totalHourWeatherList.length; j++) {
      if (newListIndex < 24) {
        hourWeather.add(totalHourWeatherList[j]);
        newListIndex++;
      } else {
        break;
      }
    }
    // print('Printing full list');
    // for (int i = 0; i < totalHourWeatherList.length; i++) {
    //   print(totalHourWeatherList[i].timeEpoch);
    // }

    return hourWeather;
  }
}



class WeatherDataModel
{
   String? cityName;
   int? lastUpdatedEpoch;
   double? temperature;
   String? condition;
   int? isDay;
   double? windSpeed;
   int? humidity;
   double? feelsLike;
   String? uv;
   int ? aqi;
   double? maxTemp;
   double? minTemp;
   String? sunRiseTime;
   String? sunSetTime;
   

   //will get xhr.response error if any of field is not initialized

  WeatherDataModel(
      [this.cityName,
      this.lastUpdatedEpoch,
      this.temperature,
      this.condition,
      this.isDay,
      this.windSpeed,
      this.humidity,
      this.feelsLike,
      this.uv,
      this.aqi,
      this.maxTemp,
      this.minTemp,
      this.sunRiseTime,
      this.sunSetTime,
      

      ]
  );

  WeatherDataModel fromJson(Map recievedMap)
  {
    double tempUv = recievedMap['current']['uv'];
    String tempUVIndex = uvIndex(tempUv);
    
    WeatherDataModel weatherDataModel = WeatherDataModel(
      cityName = recievedMap['location']['name'],
      lastUpdatedEpoch=recievedMap['current']['last_updated_epoch'],
      temperature =recievedMap['current']['temp_c'],
      condition = recievedMap['current']['condition']['text'],
      isDay = recievedMap['current']['is_day'],
      windSpeed = recievedMap['current']['wind_kph'],
      humidity =  recievedMap['current']['humidity'],
      feelsLike =  recievedMap['current']['feelslike_c'],
      uv = tempUVIndex,
      aqi = tempUv.toInt(),
      maxTemp = recievedMap['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp = recievedMap['forecast']['forecastday'][0]['day']['mintemp_c'],
      sunRiseTime= (recievedMap['forecast']['forecastday'][0]['astro']['sunrise']).toString().substring(1).toLowerCase(),
      sunSetTime= (recievedMap['forecast']['forecastday'][0]['astro']['sunset']).toString().substring(1).toLowerCase()
    );

    return weatherDataModel;
  }

  String uvIndex(double uvValue)
  {
    String uv;
    if(uvValue<=2)
    {
      uv = 'Low';
    }
    else if(uvValue<=5)
    {
      uv = 'Moderate';
    } 

    else if(uvValue<=7)
    {
       uv = 'Moderate';
    } 
    else if(uvValue<=10)
    {
       uv = 'Very High';
    }
    else 
    {
      uv = 'Extreme';
    }
    return uv;
  }


}


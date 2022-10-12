import 'dart:convert';
import 'package:http/http.dart' as http;


Future<Map> apiCall() async {
  Map responseMap = {};
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'X-RapidAPI-Key': 'bc9b49afaamsh540ff2f9f92b0b3p1b3dfcjsnea94cac5fc61',
    'X-RapidAPI-Host': 'weatherapi-com.p.rapidapi.com'
  };

  Map<String, String> queryParameters = {'q': 'Rawalpindi', 'days': '3'};

  var httpsUri = Uri(
      scheme: 'https',
      host: 'weatherapi-com.p.rapidapi.com',
      path: 'forecast.json',
      queryParameters: queryParameters);

  http.Response response = await http.get(httpsUri, headers: requestHeaders);

  if (response.statusCode == 200) {
    responseMap = jsonDecode(response.body);
  }

  return responseMap;
}

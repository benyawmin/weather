import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiProvider {
  final baseUrl = 'api.weatherapi.com';
  
  //Fetching searched weather by city
  fetchSearchedWeather(String city) async {
    final queryParameters = {
      'key': 'a37ad3c9f2054035856133301221907',
      'q': city,
      'days': '3',
      'aqi': 'no',
      'alerts': 'no'
    };
    final uri = Uri.https(baseUrl, '/v1/forecast.json', queryParameters);

    http.Response response = await http.get(uri
        );
    if (response.statusCode == 200) {
      final items = json.decode(response.body);
      return items;
    } else if (response.statusCode == 401) {
      throw Exception('Error 401');
    } else if (response.statusCode == 429) {
      throw Exception('Error 429');
    } else {
      throw Exception('Unknown problem');
    }
  }
}

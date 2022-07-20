// Repository pattern as a bridge between the UI and API to avoid direct access
import 'api_provider.dart';

class Repository {
  //Fetching searched weather by city
  fetchSearchedWeather(String city) async {
    return await ApiProvider().fetchSearchedWeather(city);
  }
}

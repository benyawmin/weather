// BLoC pattern is used as the state management
import 'package:rxdart/rxdart.dart';
import '../resources/repository.dart';

class WeatherBloc {
  final _repository = Repository();

  final _searchedListBuilder = PublishSubject();

  get searchedListBuilderStream => _searchedListBuilder.stream;

  //Fetching searched weather by city
  fetchSearchedWeather(String city) async {
    var searchedResults = await _repository.fetchSearchedWeather(city);
    if (searchedResults.isEmpty) {
      _searchedListBuilder.sink.addError('No results found');
    } else {
      _searchedListBuilder.sink.add(searchedResults);
    }
  }

  dispose() {
    _searchedListBuilder.close();
  }
}

// Creating a BLoC object for usage in the whole app
final wBloc = WeatherBloc();
/* Main screen of the weather application application
This applcation shows the weather information of the searched cities including the current info and
three days forecast
*/

// Sizer is a package to create the app responsive
import 'package:flutter/material.dart';
import 'package:weather/src/widgets/current_weather.dart';
import '../blocs/weather_bloc.dart';
import '../widgets/search_bar.dart';
import 'package:sizer/sizer.dart';
import '../widgets/forecast_item.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const SearchBar(),
      // Loading the data fetched by API and showing on the screen
      StreamBuilder(
          stream: wBloc.searchedListBuilderStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              // Using json weatherModel convertor for easier data usage
              return Column(
                children: [
                  // Current weather widget
                  CurrentWeather(snapshot),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: 100.w,
                        height: 40.h,
                        // Creating the list of 3 days forecast based on API
                        child: ListView.builder(
                          itemBuilder: ((context, index) {
                            // 3 days forecast list Items
                            return ForecastItem(snapshot, index);
                          }),
                          itemCount: snapshot.data.length,
                        )),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return SizedBox(
                  width: 300,
                  height: 300,
                  child: Text(snapshot.error.toString()));
            }
            return const SizedBox();
          })
    ]);
  }
}

/* Main screen of the weather application application
This applcation shows the weather information of the searched cities including the current info and
three days forecast
*/

// Sizer is a package to create the app responsive
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather/src/accessories.dart/hex_color_to_flutter_color.dart';
import '../blocs/weather_bloc.dart';
import '../widgets/search_bar.dart';
import 'package:sizer/sizer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Reusable textStyle
    final textStyle = {
      'city': GoogleFonts.openSans(fontSize: 20, fontWeight: FontWeight.bold),
      'degree': GoogleFonts.openSans(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: hexToColor('#937DC2')),
      'rest': GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.normal)
    };
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
                  Text(
                    snapshot.data['location']['name'].toString(),
                    style: textStyle['city'],
                  ),
                  Text(
                    // Converting the date fetched from API to a more readable date format
                    DateFormat.yMMMMd().format(DateFormat("yyyy-mm-dd hh:mm")
                        .parse(
                            snapshot.data['location']['localtime'].toString())),
                    style: textStyle['rest'],
                  ),
                  Image.network(
                      scale: 0.5,
                      'http:${snapshot.data['current']['condition']['icon']}'),
                  Text(
                    '${snapshot.data['current']['temp_c'].toInt()}°',
                    style: textStyle['degree'],
                  ),
                  Text(
                    snapshot.data['current']['condition']['text'].toString(),
                    style: textStyle['rest'],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: 100.w,
                        height: 40.h,
                        // Creating the list of 3 days forecast based on API
                        child: ListView.builder(
                          itemBuilder: ((context, index) {
                            return Opacity(
                              opacity: 0.7,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 5,
                                color: hexToColor('#cecece'),
                                child: SizedBox(
                                  width: 10.w,
                                  height: 20.h,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            DateFormat.EEEE().format(
                                                DateTime.parse(
                                                    snapshot.data['forecast']
                                                            ['forecastday']
                                                        [index]['date'])),
                                            style: textStyle['rest'],
                                          ),
                                          Text(
                                            DateFormat.yMMMMd().format(
                                                DateTime.parse(
                                                    snapshot.data['forecast']
                                                            ['forecastday']
                                                        [index]['date'])),
                                            style: textStyle['rest'],
                                          ),
                                        ],
                                      ),
                                      Image.network(
                                          scale: 0.8,
                                          'http:${snapshot.data['forecast']['forecastday'][index]['day']['condition']['icon']}'),
                                      Text(
                                        '${snapshot.data['forecast']['forecastday'][index]['day']['avgtemp_c'].toInt()}°',
                                        style: textStyle['degree'],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
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

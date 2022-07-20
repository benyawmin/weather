// import 'package:flutter/material.dart';
// import 'package:weather/src/blocs/weather_bloc.dart';

// class WeatherBlocProvider extends InheritedWidget {
//   final WeatherBloc bloc;

//   WeatherBlocProvider({Key? key, required Widget child})
//       : bloc = WeatherBloc(),
//         super(key: key, child: child);

//   @override
//   bool updateShouldNotify(_) => true;

//   static WeatherBloc of(BuildContext context) {
//     return (context.dependOnInheritedWidgetOfExactType<WeatherBlocProvider>()
//             as WeatherBlocProvider)
//         .bloc;
//   }
// }
import 'package:flutter/material.dart';
import 'package:weather/src/accessories.dart/hex_color_to_flutter_color.dart';
import 'screens/main_screen.dart';
import 'package:sizer/sizer.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'News',
        theme: ThemeData(primaryColor: Colors.white),
        home: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: hexToColor('#937DC2'),
              title: const Text('Weather'),
            ),
            body: const SingleChildScrollView(child: MainScreen()),
          ),
        ),
      );
    });
  }
}

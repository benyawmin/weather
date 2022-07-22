// Current weather widget

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../accessories.dart/text_style.dart';

class CurrentWeather extends StatelessWidget {
  AsyncSnapshot snapshot;
  
  CurrentWeather(this.snapshot, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          snapshot.data['location']['name'].toString(),
          style: textStyle['city'],
        ),
        Text(
          // Converting the date fetched from API to a more readable date format
          DateFormat.yMMMMd().format(DateFormat("yyyy-mm-dd hh:mm")
              .parse(snapshot.data['location']['localtime'].toString())),
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
      ],
    );
  }
}

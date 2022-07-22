// Each list Item in the 3 days forecast widget

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../accessories.dart/hex_color_to_flutter_color.dart';
import '../accessories.dart/text_style.dart';

class ForecastItem extends StatelessWidget {
  AsyncSnapshot snapshot;
  int index;

  ForecastItem(this.snapshot, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    DateFormat.EEEE().format(DateTime.parse(snapshot
                        .data['forecast']['forecastday'][index]['date'])),
                    style: textStyle['rest'],
                  ),
                  Text(
                    DateFormat.yMMMMd().format(DateTime.parse(snapshot
                        .data['forecast']['forecastday'][index]['date'])),
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
  }
}

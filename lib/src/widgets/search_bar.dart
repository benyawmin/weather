import 'package:flutter/material.dart';
import '../accessories.dart/hex_color_to_flutter_color.dart';
import '../blocs/weather_bloc.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextField(
        onSubmitted: (text) {
          wBloc.fetchSearchedWeather(text);
        },
        autocorrect: false,
        decoration: InputDecoration(
            hintStyle: TextStyle(color: hexToColor('#cecece')),
            contentPadding: const EdgeInsets.all(10),
            isDense: true,
            filled: true,
            // border: InputBorder.none,
            fillColor: hexToColor('#f5f5f5'),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            hintText: 'Search City Weather...'),
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}

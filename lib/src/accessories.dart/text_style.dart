import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'hex_color_to_flutter_color.dart';

// Reusable textStyle
final textStyle = {
      'city': GoogleFonts.openSans(fontSize: 20, fontWeight: FontWeight.bold),
      'degree': GoogleFonts.openSans(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: hexToColor('#937DC2')),
      'rest': GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.normal)
    };
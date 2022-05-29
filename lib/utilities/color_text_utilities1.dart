import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtilites {
  final ButtonText = GoogleFonts.inriaSans(
    fontSize: 22,
    color: Colors.white,
  );
}

class ColorUtilites {
  static Color white = Colors.white;
  static Color blue = const Color(0xff6367BA);
  static Color red = const Color(0xffF24E1E);
  static Color textFieldBorderColor = const Color(0xff878787);
  static Color black = Colors.black;
  static Color grey = const Color(0xff848484);
}

var baslikStyle = GoogleFonts.amiri(color: Colors.black, fontSize: 25.sp);
var baslikStyleBold = GoogleFonts.amiri(color: Colors.black, fontSize: 25.sp, fontWeight: FontWeight.bold);

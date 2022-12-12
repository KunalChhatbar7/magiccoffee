import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppData {
  TextStyle regulterTextStyle(
      {required double FontSize, Color? FontColor, Decoration}) {
    return GoogleFonts.poppins(
      fontSize: FontSize,
      color: FontColor ?? AppColors().BlackColor,
      decoration: Decoration,
    );
  }

  TextStyle splashScrenTitleStyle() {
    return GoogleFonts.reenieBeanie(fontSize: 50, color: Colors.white);
  }
}

class AppColors {
  Color AppMainColor = Color(0xff324A59);
  Color WhiteColor = Color(0xffffffff);
  Color BlackColor = Color(0xff181D2D);
  Color SubTextColor = Color(0xffAAAAAA);
}

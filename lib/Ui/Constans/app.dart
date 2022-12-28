import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppData {
  TextStyle regulterTextStyle(
      {required double FontSize,
      Color? FontColor,
      Decoration,
      FontWeight? FontWeights}) {
    return GoogleFonts.poppins(
      fontSize: FontSize,
      color: FontColor ?? AppColors().BlackColor,
      decoration: Decoration,
      fontWeight: FontWeights,
    );
  }

  TextStyle splashScrenTitleStyle() {
    return GoogleFonts.reenieBeanie(fontSize: 50, color: Colors.white);
  }
}

class AppColors {
  Color AppMainColor = Color(0xff324A59);
  Color WhiteColor = Color(0xffffffff);
  Color ScaffoldBackgroundColor = Color(0xffFFFFFF);
  Color BlackColor = Color(0xff181D2D);
  Color SubTextColor = Color(0xffAAAAAA);
  Color SubBottomBarColor = Color(0xffD8D8D8);
  Color ProfileBackgroudColor = Color(0xffF7F8FB);
  Color ProfileTitleColor = Color(0xff001833).withOpacity(0.22);
}

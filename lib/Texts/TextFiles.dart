import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Colors/Colors.dart';

OBTitle(String x){
  return Text(x,style: GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      fontSize: 25.sp,
      color: Tile,
      height: 1.h
  ),);
}
OBDesc(String x){
  return Text(x,style: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 13.sp,
      color: Subtitle,
      height: 1.h
  ),);
}


OBForm(String x,FontWeight s){
  return Text(x,style: GoogleFonts.poppins(
    color: Subtitle,
    fontSize: 17.04.sp,
    fontWeight: s,
  ),);
}

OBStoryTitle(String x,FontWeight w){
  return Text(x,style: GoogleFonts.poppins(
    color: White,
    fontSize: 13,
    fontWeight: w,
    height: 0.8.h,
  ),);
}

OBProfileRadio(String x,Color col){
  return Text(x,style: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 13.sp,
      color: col,
      height: 1.h
  ),);
}
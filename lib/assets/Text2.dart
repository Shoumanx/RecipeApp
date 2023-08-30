import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Color2.dart';

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

OrangeraTitle(String x,Color col){
  return Text(x,style: GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      fontSize: 28.sp,
      color: col,
  ),);
}

HomeHelloTitle(String x,Color col){
  return Text(x,style: GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 19.sp,
    color: col,
    height: 1.h,
  ),);
}
HomeHelloSubtitle(String x,Color col){
  return Text(x,style: GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
    color: col,
    height: 1.h,
  ),);
}

MealBoxTitle(String x,Color col){
  return Text(x,style: GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 19.sp,
    color: col,
    height: 1.h,
  ),);
}
MealBoxSubtitle(String x,Color col){
  return Text(x,style: GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
    color: col,
    height: 1.h,
  ),);
}

CardItemName(String x,Color col){
  return Text(x,style: GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 19.sp,
    color: col,
    height: 1.h,
  ),overflow: TextOverflow.clip,maxLines: 1,);
}
CardItemCP(String x,Color col){
  return Text(x,style: GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
    color: col,
    height: 1.h,
  ),);
}

Calories(String x,Color col){
  return Text(x,style: GoogleFonts.abrilFatface(
    fontWeight: FontWeight.w500,
    fontSize: 21.sp,
    color: col,
  ),);
}
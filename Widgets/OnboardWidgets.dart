import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orangera/Colors/Colors.dart';
import 'package:orangera/Texts/TextFiles.dart';


PlanBlocks(String icon,String text){
  return Container(
    width: 80.w,height: 85.h,
    decoration: BoxDecoration(
      color: Primary,
     borderRadius: BorderRadius.circular(10.r),
    ),
    child: Container(
      padding: EdgeInsets.all(2.h),
      child: Column(children: [
        Expanded(flex: 2,
            child: Stack(alignment: Alignment.center,
              children: [
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
          color: White,
          borderRadius: BorderRadius.vertical(top: Radius.circular(8.r),bottom: Radius.circular(3.r)),
        ),
                ),
                Container(child: SvgPicture.asset(icon,fit: BoxFit.fitWidth,width: 40.w,))
              ],
            )),
        Expanded(flex: 1,child: Container(alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: OBStoryTitle(text,FontWeight.w700)
        ))
      ],),
    ),
  );
}
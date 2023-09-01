import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Colors/Colors.dart';

OBFieldForm(TextEditingController x){
  return Container(width: 60.w,
      child: TextFormField(
        controller: x,
        textAlignVertical: TextAlignVertical.bottom,
        style: TextStyle(color: Primary, fontSize: 18.sp, fontWeight: FontWeight.w600,),
        textAlign: TextAlign.start,
        decoration: InputDecoration(contentPadding: EdgeInsets.only(bottom: 8.h),
        border: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFD8D8D8))),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Primary)),
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(3)
        ],
    )
  );
}

OBFieldFormProfile(TextEditingController x, String hint){
  return Container(
      child: TextFormField(
        controller: x,
        textAlignVertical: TextAlignVertical.bottom,
        style: TextStyle(color: Primary, fontSize: 18.sp, fontWeight: FontWeight.w600,),
        textAlign: TextAlign.start,
        decoration: InputDecoration(hintText: hint,
          hintStyle: TextStyle(color:Subtitle,fontSize: 13.sp,fontWeight: FontWeight.w400),
          contentPadding: EdgeInsets.only(bottom: 8.h),
          border: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFD8D8D8))),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Primary)),
        ),
      )
  );
}

OBFieldFormProfileNumber(TextEditingController x, String hint){
  return Container(
      child: TextFormField(
        controller: x,
        textAlignVertical: TextAlignVertical.bottom,
        style: TextStyle(color: Primary, fontSize: 18.sp, fontWeight: FontWeight.w600,),
        textAlign: TextAlign.start,
        decoration: InputDecoration(hintText: hint,
          hintStyle: TextStyle(color:Subtitle,fontSize: 13.sp,fontWeight: FontWeight.w400),
          contentPadding: EdgeInsets.only(bottom: 8.h),
          border: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFD8D8D8))),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Primary)),
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(3)
        ],
      )
  );
}


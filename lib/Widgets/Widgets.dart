import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orangera/Screens/Item_Select.dart';

import '../assets/Color2.dart';
import '../assets/Text2.dart';


Widget MealCards(String BGsvg,Color BGcolor,ImageProvider icn,String Title,String cal,Color ButtonShadow){
  return Stack(
      children: [
        SizedBox(height: 200.h,width: 135.w,
        child: Stack(alignment: Alignment.bottomCenter,children: [
          Container(height: 180.h,width: 135.w,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(100.r),),
              boxShadow: [BoxShadow(
                color: BGcolor,
                offset: Offset(0.w,7.h),
                blurRadius: 30.r,
              )]
            ),
              child: SvgPicture.asset(BGsvg)),
          Positioned(
            top: 10.h,left: 10.w,
            child: Image(image: icn,width: 50.w),
          ),

        ],),
        ),
        Container(
          height: 240.h,
          padding: EdgeInsets.only(top: 80.h,left: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MealBoxTitle(Title, White),
              SizedBox(height: 10.h,),
              MealBoxSubtitle('Recommended:\n$cal Kcal', White),
              SizedBox(height: 10.h,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  boxShadow: [
                    BoxShadow(
                      color: ButtonShadow,
                      offset: Offset(5.w, 5.h),
                      blurRadius: 15.r,
                      spreadRadius: 3.r,
                    )
                  ]
                ),
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: White,
                  child: Icon(CupertinoIcons.right_chevron,color: BGcolor),
                ),
              )
          ],),
        )
      ],
    );
}

Widget ItemCards(String img,String Name,String kcal,String Price){
  return Container(
    margin: EdgeInsets.all(20.w),
    width: 250.w,height: 265.h,
    decoration: BoxDecoration(
        color: CardBG,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Color(0x265F7EC4),
            blurRadius: 5.r,
            offset: Offset(2.w,5.h),
          )
        ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
            Container(
              width: 240.w,height: 180.h,
              decoration: BoxDecoration(
                  color: CardIMG,
                  borderRadius: BorderRadius.circular(7.r)
              ),
            ),
            Container(
              width: 240.w,height: 180.h,
              alignment: Alignment.center,
              padding: EdgeInsets.all(25.w),
              child: Image(
                image: AssetImage(img),
                fit: BoxFit.cover,
              ),
            )
          ],),
          SizedBox(height: 10.h,),
          CardItemName(Name,Tile),
          SizedBox(height: 5.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              SvgPicture.asset('lib/Media/Svg/Kcal.svg',color: Primary,width: 15.w),
              SizedBox(width: 5.w),
              CardItemCP(kcal, Subtitle)
            ],),
            CardItemCP(Price, Subtitle)
          ],)
        ],
      ),
    ),
  );
}
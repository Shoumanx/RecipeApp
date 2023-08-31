import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              InkWell(
                onTap: (){},
                child: Container(
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

Widget ItemDetails(String Icon,String Title,String Calories){
  return Container(
    height: 40.h,width: double.maxFinite,
    padding: EdgeInsets.symmetric(vertical:10.h,horizontal: 15.w),
    decoration: BoxDecoration(
      color: CardIMG,
        borderRadius: BorderRadius.circular(20.r),
      boxShadow: [
        BoxShadow(
          color: Colors.white,
          offset: Offset(-4.w, -4.h),
          blurRadius: 15.r,
          spreadRadius: 1.r,
        ),
        BoxShadow(
          color: Color(0xffC5D3FF),
          offset: Offset(4.w, 4.h),
          blurRadius: 15.r,
          spreadRadius: 1.r,
        ),
    ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          SvgPicture.asset(Icon,color: Primary,width: 15.w,height: 15.h,),
          SizedBox(width: 5.w,),
          ItemSelectTitle(Title,Primary)
        ],),
        ItemSelectSubtitle(Calories, Subtitle)
      ],
    ),
  );
}



Widget CartCaloriesCheckOut(String Icon,String Title,String Calories){
  return Container(
    height: 40.h,width: double.maxFinite,
    padding: EdgeInsets.symmetric(vertical:10.h,horizontal: 15.w),
    decoration: BoxDecoration(
      color: White,
      borderRadius: BorderRadius.circular(20.r),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          SvgPicture.asset(Icon,color: Primary,width: 15.w,height: 15.h,),
          SizedBox(width: 5.w,),
          ItemSelectTitle(Title,Primary)
        ],),
        ItemSelectSubtitle(Calories, Subtitle)
      ],
    ),
  );
}


Widget ItemsCards(String Img,String Tit,String cal){
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5.h),
    width: 285.w,height:75.h,
    padding: EdgeInsets.all(10.w),
    decoration: BoxDecoration(
        color: White,
        borderRadius: BorderRadius.circular(10.r)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              width: 65.w,
              padding: EdgeInsets.all(7.w),
              decoration: BoxDecoration(
                  color: Color(0xffE8ECFF),
                  borderRadius: BorderRadius.circular(10.r)
              ),
              child: Image(image: AssetImage(Img)),
            ),
            SizedBox(width: 15.w,),
            Container(
              width: 150.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeHelloTitle(Tit, Secondary),
                  HomeHelloSubtitle(cal, Secondary)
                ],),
            ),
          ],),
        InkWell(
          child: CircleAvatar(
            radius: 15.r,
            backgroundColor: Tile,
            child: Icon(CupertinoIcons.xmark_circle_fill,color: White,size: 15.w,),
          ),
        )
      ],
    ),
  );
}
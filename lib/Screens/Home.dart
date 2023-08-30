import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:temp/assets/Color2.dart';
import 'package:temp/assets/Text2.dart';

import '../Widgets/Widgets.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background,
      resizeToAvoidBottomInset: false,
      body: ScreenUtilInit(designSize: Size(360, 690),
          builder: (context, child) => SafeArea(
            child: Container(
              width: double.maxFinite,
              child: Column(children: [
                Row(
                  children: [
                    Container(
                      width: 320.w,height: 120.h,
                      decoration: BoxDecoration(
                        color: White,
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(75)),
                        boxShadow: [BoxShadow(color: Color(0x156F8FEA),offset: Offset(2.w, 10.h),blurRadius: 32.r)],),
                      child: Container(
                        padding: EdgeInsets.only(left:35.w),
                        child: Row(children: [
                          Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient:GR
                              ),
                              child: CircleAvatar(
                                  radius: 25.r,
                                  backgroundColor: Colors.transparent,
                                child: SvgPicture.asset('lib/Media/Svg/Home.svg',color: White,width: 20.w,),
                              )
                          ),
                          SizedBox(width: 10.w,),
                          OrangeraTitle('Home',Secondary),
                        ],),
                      ),
        ),
                  ],
                ),
                SizedBox(height: 35.h,),
                Container(
                  width: 320.w,height: 80.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    color: Highlight,
                  ),
                  alignment: Alignment.center,
                  child: ListTile(
                    horizontalTitleGap: 15.w,
                    contentPadding: EdgeInsets.zero,
                    leading: Container(margin: EdgeInsets.only(left: 20.w),
                      child: ClipOval(
                        child: Container(
                          color: Background,
                          width: 50.w,height: 50.h,
                          child: Image(image: AssetImage('lib/Media/Images/male.png')),
                        ),
                      ),
                    ),
                    isThreeLine: true,
                    title: HomeHelloTitle('Hello,',Secondary),
                    subtitle: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HomeHelloTitle('Abdulrahman', Secondary),
                          HomeHelloSubtitle('Enjoy Your Meals', Secondary), // Add the third text here
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 35.h,),
                Container(height: 370.h,
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 20.w,),
                        OrangeraTitle('Meals', Secondary)
                    ],),
                    SizedBox(height: 10.h,),
                    SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          MealCards('lib/Media/Svg/Breakfast.svg',Color(0xA6F96C7C),AssetImage('lib/Media/Icons/Bread.png'),'Breakfast','500-600',Color(0xffDD5355),(){}),
                          SizedBox(width: 25.w,),
                          MealCards('lib/Media/Svg/Lunch.svg',Color(0xA6474AD9),AssetImage('lib/Media/Icons/Steak.png'),'Lunch','600-700',Color(0xff3038CA),(){}),
                          SizedBox(width: 25.w,),
                          MealCards('lib/Media/Svg/Dinner.svg',Color(0xA6433D91),AssetImage('lib/Media/Icons/Bowl.png'),'Dinner','700-800',Color(0xff130F4C),(){}),
                        ],
                      ),
                    )
                  ],),
                )
      ],),
    ),)
      ),
    );
  }
}

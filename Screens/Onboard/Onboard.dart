import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orangera/Screens/Onboard/1_Description.dart';
import 'package:orangera/Screens/Onboard/2_Credentials.dart';
import 'package:orangera/Screens/Onboard/4_Target.dart';
import 'package:orangera/Screens/Onboard/6_Currency.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Colors/Colors.dart';
import '3_Plan.dart';
import '5_Profile.dart';

class Onboard extends StatelessWidget {
  late PageController controller;

  Onboard({Key? key}) : super(key: key) {
    controller = PageController();
  }

////////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(designSize: Size(360,690),
      builder: (context, child) => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              PageView(controller: controller,
                children: [
                  Description(),
                  Credentials(),
                  Plan(),
                  Target(),
                  Profile(),
                  CurrencyOB(),],),
              Center(
                child: Container(width: 271.w,alignment: Alignment(0,0.7.h),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothPageIndicator(controller: controller,count: 6,
                        effect:WormEffect(type: WormType.thin,dotWidth: 8.w,dotHeight: 8.h,dotColor: Color(0xffD7D7D7),activeDotColor: Color(0xffAAAAAA)),),
                      InkWell(onTap: () {if (controller.page != 5) {controller.nextPage(duration: Duration(milliseconds: 500),curve: Curves.ease,);}},
                        child: Container(child: CircleAvatar(maxRadius: 25.r,child: Icon(Icons.arrow_forward_ios_rounded,color: White,),backgroundColor: Primary),
                          decoration: BoxDecoration(boxShadow: [BoxShadow(color: Primary.withOpacity(0.3),blurRadius: 10,spreadRadius: 2.r)],borderRadius: BorderRadius.circular(40.r)),),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}


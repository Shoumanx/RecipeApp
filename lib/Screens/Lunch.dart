import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:temp/assets/Text2.dart';
import '../Widgets/Navbar.dart';
import '../assets/Color2.dart';

class Launch extends StatelessWidget {
   Launch({super.key});

  BottomNavController Controller = Get.put(BottomNavController());


  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360,690),
      builder: (context, child) =>SafeArea(
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Background,
          floatingActionButton: Container(
            width: 330.w,
            padding: EdgeInsets.all(10.w),
            margin: EdgeInsets.only(bottom: 20.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: Background,
                boxShadow: [BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 30.r,
                    offset: Offset(0.w,10.h))]
            ),
            child: Row(children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  width: 50.w,height: 50.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.r)),
                      gradient: GR
                  ),
                  child: Calories('2500', White),
                ),
              ),
              GNav(
                tabMargin: EdgeInsets.symmetric(horizontal: 10.w),
                onTabChange: (value){Controller.index.value=value;},
                tabs: [
                  GButton(
                    icon: Icons.home,
                    iconSize: 20.w,
                    hoverColor: White,
                    iconColor: Primary,
                    text: 'Home',
                    gap: 10.w,
                    backgroundColor: Primary,
                    padding: EdgeInsets.all(15.w),
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    iconActiveColor: White,
                    textColor: White,
                  ),
                  GButton(icon: Icons.home,iconSize: 25.w,hoverColor: White,iconColor: Primary,text: 'Account',gap: 10,backgroundColor: Primary,padding: EdgeInsets.all(15.w),borderRadius: BorderRadius.all(Radius.circular(20.r)),iconActiveColor: White,textColor: White,),
                ],)
            ],),
          ),floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          body: Obx(() => Controller.Pages[Controller.index.value]),
        ),
      )
      ),
    );
  }
}
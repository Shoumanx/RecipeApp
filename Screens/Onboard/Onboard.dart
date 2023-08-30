import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orangera/DataBase/DataBaseLogic.dart';
import 'package:orangera/Screens/Onboard/1_Description.dart';
import 'package:orangera/Screens/Onboard/2_Credentials.dart';
import 'package:orangera/Screens/Onboard/4_Target.dart';
import 'package:orangera/Screens/Onboard/6_Currency.dart';
import 'package:orangera/Screens/Splash/Program.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Colors/Colors.dart';
import '3_Plan.dart';
import '5_Profile.dart';

int weight = 0, height = 0, age = 0, targetWeight = 0;
double currency = 0;
String gen = '', lgm = '', name = '';

TextEditingController kg = TextEditingController();
TextEditingController cm = TextEditingController();
TextEditingController tkg = TextEditingController();
TextEditingController nameX = TextEditingController();
TextEditingController ageX = TextEditingController();

class Onboard extends StatelessWidget {
  late PageController controller;
  late DataBaseLogic dx;
  Onboard({Key? key, required DataBaseLogic x}) : super(key: key) {
    controller = PageController();
    dx = x;
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
                      InkWell(onTap: () {
                        if (controller.page != 5)
                        {
                          controller.nextPage(duration: Duration(milliseconds: 500),curve: Curves.ease,);
                        }
                        else if(controller.page == 5){
                          weight = int.parse(kg.text);
                          height = int.parse(cm.text);
                          targetWeight = int.parse(tkg.text);
                          name = nameX.text;
                          age = int.parse(ageX.text);
                          print(''
                              '\nWeight : $weight '
                              '\n Height : $height '
                              '\n (L, M, G) : $lgm '
                              '\n TargetWeight : $targetWeight'
                              '\n Gender : $gen'
                              '\n Name : $name'
                              '\n Age : $age'
                          );
                          if(checker() == true){
                            formula();
                            dx.insert(category: 'currency', name: 'currency', calories: '', price: '', count: currency.toInt(), gmORml: '');
                            dx.insert(category: 'currentCurrency', name: 'currency', calories: '', price: '', count: currency.toInt(), gmORml: '');
                            dx.insert(category: 'fullName', name: name, calories: '', price: '', count: 0, gmORml: '');
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Showx(fullName: name, currency: currency.toInt())),
                            );
                          }
                        }
                        },
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




formula(){
  if(gen == 'M'){
    currency = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
  }
  else{
    currency = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
  }
  if(lgm == 'L')   currency -= 500;
  else if(lgm == 'G')   currency += 500;
}

bool checker(){
  return (weight == 0 || height == 0 || lgm == '' || targetWeight == 0 || gen == '' || name == '' || age == 0) ? false : true;
}
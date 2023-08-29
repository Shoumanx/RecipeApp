import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orangera/Texts/TextFiles.dart';
import 'package:orangera/Widgets/Fields.dart';
import 'package:orangera/Widgets/OnboardWidgets.dart';
import '../../Colors/Colors.dart';

class Plan extends StatelessWidget {
  Plan({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), // Corrected onTap function
        child: ScreenUtilInit(
          designSize: Size(360, 690),
          child: Container(
            color: White,
            child: Column(
              children: [
                Container(
                  width: 360.w,
                  height: 394.69.h,
                  child: SvgPicture.asset(
                    'lib/Media/Svg/Plan.svg',
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
                SizedBox(height: 15.h,),
                Container(
                  width: 271.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OBTitle('Choose Your\nPlan'),
                      SizedBox(height: 2.5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          PlanBlocks('lib/Media/Svg/Gain.svg','Gain\nWeight'),
                          SizedBox(width: 15.w,),
                          PlanBlocks('lib/Media/Svg/Maintain.svg','Maintain\nWeight'),
                          SizedBox(width: 15.w,),
                          PlanBlocks('lib/Media/Svg/Lose.svg','Lose\nWeight'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

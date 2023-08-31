import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orangera/Texts/TextFiles.dart';

import '../../Colors/Colors.dart';

class CurrencyOB extends StatelessWidget {
  const CurrencyOB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenUtilInit(designSize: Size(360,690),
      child: Container(color: White,
      child: Column(children: [
        Container(width: 360.w,height: 394.69.h,
             child: SvgPicture.asset('lib/Media/Svg/Currency.svg',fit: BoxFit.cover,alignment: Alignment.bottomCenter,)),
        SizedBox(height: 30.h,),
        Container(width: 271.w,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            OBTitle('Reset Every\n24 Hours'),
            SizedBox(height: 2.5.h),
            Container(width: 250.w,child: OBDesc('Your journey to better health and fitness is refreshed every 24 hours. Your calorie counter refreshes daily for a clean start.')),
          ],),
        ),
      ]),),
        )
    );
  }
}
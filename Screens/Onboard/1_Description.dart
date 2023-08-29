import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orangera/Texts/TextFiles.dart';

import '../../Colors/Colors.dart';

class Description extends StatelessWidget {
  const Description({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenUtilInit(designSize: Size(360,690),
      child: Container(color: White,
      child: Column(children: [
        Container(width: 360.w,height: 394.69.h,
             child: SvgPicture.asset('lib/Media/Svg/Desc.svg',fit: BoxFit.cover,alignment: Alignment.bottomCenter,)),
        SizedBox(height: 30.h,),
        Container(width: 271.w,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            OBTitle('Your Path to\nFitness'),
            SizedBox(height: 2.5.h),
            Container(child: OBDesc('Orangera offers a curated list of foods with detailed nutrition info, helping you make informed choices that match your goals.')),
          ],),
        ),
      ]),),
        )
    );
  }
}
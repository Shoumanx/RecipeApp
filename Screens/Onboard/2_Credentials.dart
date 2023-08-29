import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orangera/Screens/Onboard/Onboard.dart';
import 'package:orangera/Texts/TextFiles.dart';
import 'package:orangera/Widgets/Fields.dart';
import '../../Colors/Colors.dart';

class Credentials extends StatelessWidget {
  Credentials({super.key});

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
                    'lib/Media/Svg/Credentials.svg',
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
                SizedBox(height: 45.h,),
                Container(
                  width: 271.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OBTitle('Step on the\nScale'),
                      SizedBox(height: 2.5.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          OBFieldForm(kg),
                          SizedBox(width: 10.w,),
                          OBForm('Kg',FontWeight.w700),
                          SizedBox(width: 40.w,),
                          OBFieldForm(cm),
                          SizedBox(width: 10.w,),
                          OBForm('Cm',FontWeight.w700)
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

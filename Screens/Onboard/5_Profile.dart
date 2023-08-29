import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orangera/Texts/TextFiles.dart';
import 'package:orangera/Widgets/Fields.dart';
import '../../Changer/changeLogic.dart';
import '../../Changer/changeState.dart';
import '../../Colors/Colors.dart';
import 'Onboard.dart';

List<String> gender =['male','female'];


class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeLogic(),
      child: BlocConsumer<ChangeLogic, ChangeState>(
        listener: (context, state){},
        builder: (context, state){
          ChangeLogic obj = BlocProvider.of(context);
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
                          'lib/Media/Svg/Profile.svg',
                          fit: BoxFit.cover,
                          alignment: Alignment.bottomCenter,
                        ),
                      ),
                      SizedBox(height: 30.h,),
                      Container(
                        width: 271.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            OBTitle('Nice to meet you'),
                            SizedBox(height: 2.5.h),
                            OBFieldFormProfile(nameX, 'Name'),
                            OBFieldFormProfileNumber(ageX, 'Age'),
                            SizedBox(height: 5.h,),
                            Row(children: [
                              Radio(value: gender[0], groupValue: obj.RadioState, onChanged: (value){
                                obj.RadioState = value.toString();
                                gen = 'M';
                                obj.changeRadioState();
                              },
                                  activeColor: Male,fillColor: MaterialStatePropertyAll(Male)),
                              OBProfileRadio('Male',Male),
                              Radio(value: gender[1], groupValue: obj.RadioState, onChanged: (value){
                                obj.RadioState = value.toString();
                                gen = 'F';
                                obj.changeRadioState();
                              },
                                  activeColor: Female,fillColor: MaterialStatePropertyAll(Female)),
                              OBProfileRadio('Female',Female),
                            ],)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );

        },
      ),
    );
  }
}



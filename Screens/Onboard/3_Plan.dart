import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orangera/Texts/TextFiles.dart';
import 'package:orangera/Widgets/OnboardWidgets.dart';
import '../../Changer/changeLogic.dart';
import '../../Changer/changeState.dart';
import '../../Colors/Colors.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'Onboard.dart';

class Plan extends StatelessWidget {

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
                                InkWell(
                                  onTap: (){
                                    obj.changeColorGain();
                                    lgm = 'G';
                                  },
                                  child: PlanBlocks('lib/Media/Svg/Gain.svg','Gain\nWeight', obj.gain, 1),
                                ),
                                SizedBox(width: 15.w,),
                                InkWell(
                                  onTap: (){
                                    obj.changeColorMain();
                                    lgm = 'M';
                                  },
                                  child: PlanBlocks('lib/Media/Svg/Maintain.svg','Maintain\nWeight', obj.maintain, 2),
                                ),
                                SizedBox(width: 15.w,),
                                InkWell(
                                  onTap: (){
                                    obj.changeColorLose();
                                    lgm = 'L';
                                  },
                                  child: PlanBlocks('lib/Media/Svg/Lose.svg','Lose\nWeight', obj.lose, 3),
                                ),

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

        },
      ),
    );
  }
}



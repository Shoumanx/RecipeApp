import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../Changer/changeLogic.dart';
import '../../DataBase/DataBaseLogic.dart';
import '../../DataBase/DataBaseState.dart';
import '../../DataBase/foodinsertion.dart';
import '../../assets/Color2.dart';
import '../Onboard/Onboard.dart';
import 'Lunch.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataBaseLogic()..createDateBase(),
      child: BlocConsumer<DataBaseLogic, DataBaseState>(
        listener: (context, state){},
        builder: (context, state){
          DataBaseLogic obj = BlocProvider.of(context);
          return GestureDetector(
            onTap: (){
              DateTime now = DateTime.now();

              // Format the date as per your requirement
              String currentDate = DateFormat('yyyy-MM-dd').format(now);
              // String currentDate = '2023-08-29';
              print('now: $now \t\t\t currentDate: $currentDate');
              print(obj.IsIntro);
              if(obj.IsIntro == 0){
                insertFood(obj);
                obj.insert(category: 'date', name: currentDate, calories: '', price: '', count: 1, gmORml: '');
                obj.insert(category: 'IsIntro', name: 'IsIntro', calories: '', price: '', count: 1, gmORml: '');

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Onboard(x: obj)),
                );
              }
              else if(obj.IsIntro == 1){
                if(currentDate != obj.savedDate){
                  obj.currentCurrency = obj.currency;
                  obj.updateDate(currentDate);
                }
                currentCurrencyx = obj.currentCurrency;
                fullName = obj.fullName;
                maleFemale = (obj.maleOrFemale == 'M') ? 'male' : 'female';
                print(obj.maleOrFemale);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Launch()),
                );
              }
            },
            child: Scaffold(
              backgroundColor: Background,
              resizeToAvoidBottomInset: false,
              body: ScreenUtilInit(designSize: Size(360, 690),
                  builder: (context, child) =>
                      SafeArea(
                          child: Container(
                            alignment: Alignment.center,
                            child: SvgPicture.asset('lib/Media/Svg/Logo.svg'),
                          ))
              ),
            ),
          );
        },
      ),
    );
  }
}

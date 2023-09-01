import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Changer/changeLogic.dart';
import '../../Changer/changeState.dart';
import '../../DataBase/DataBaseLogic.dart';
import '../../assets/Color2.dart';
import '../../Widgets/Widgets.dart';
import '../../assets/Text2.dart';
import 'Lunch.dart';


class Add extends StatelessWidget {
  DataBaseLogic bx = DataBaseLogic();
  String foodLink = '', foodName = '', foodCalories = '', orI = '';
  int foodCount = 0;
  Add({Key? key, required this.foodLink, required this.foodCalories, required this.foodCount, required this.foodName, required this.orI}) : super(key: key);

  FocusNode Calories = FocusNode();


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (context) => ChangeCartLogic(),
        child: BlocConsumer<ChangeCartLogic, ChangeCartState>(
        listener: (context, state){},
        builder: (context, state){
        ChangeCartLogic obj = BlocProvider.of(context);
        return GestureDetector(
          onTap: () => {FocusScope.of(context).unfocus()},
          child: Scaffold(
            backgroundColor: Background,
            resizeToAvoidBottomInset: false,
            body: ScreenUtilInit(designSize: Size(360, 690),
                builder: (context, child) => SafeArea(
                  child: Container(
                    padding: EdgeInsets.only(top: 45.h),
                    width: double.maxFinite,
                    child: Column(children: [
                      SizedBox(
                        height: 250.h,
                        child:Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                          Stack(children: [
                            Container(
                              width: 270.w,height: 240.h,
                              decoration: BoxDecoration(
                                  boxShadow: [BoxShadow(
                                    color: Color(0x245F7EC4),
                                    offset: Offset(5.w, 5.h),
                                    blurRadius: 5.r,
                                  )],
                                  borderRadius: BorderRadius.circular(20.r)
                              ),
                              child: SvgPicture.asset('lib/Media/Svg/ItemSelectBG.svg'),
                            ),
                            Container(
                              width: 270.w,height: 240.h,
                              padding: EdgeInsets.all(40.w),
                              child: Image(image: AssetImage(foodLink)),
                            )
                          ],),
                          Positioned(
                            top: 0,left: 20,
                            child: InkWell(
                              onTap: (){Navigator.of(context).pop();},
                              child: Container(
                                width: 50.w,height: 20.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  color: Tile
                                ),
                                child: Buttons('Back',White),
                              ),
                            ),
                          )
                        ],) ,
                      ),
                      SizedBox(height:25.h,),
                      Container(
                        width: 270.w,height: 300.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ItemSelectName(foodName ,Tile),
                            Container(
                              height: 180.h,
                              padding: EdgeInsets.all(14.w),
                              decoration: BoxDecoration(
                                color: Color(0xffDCE4FF),
                                borderRadius: BorderRadius.circular(10.r)
                              ),
                              child: Column(
                                children: [
                                  ItemDetails('lib/Media/Svg/Kcal.svg','Calories',foodCalories),
                                  SizedBox(height: 7.h,),
                                  ItemDetails('lib/Media/Svg/Calculator.svg','Calculated', '${obj.counting}'),
                                  SizedBox(height: 7.h,),
                                  Container(
                                    height: 40.h,width: double.maxFinite,
                                    padding: EdgeInsets.symmetric(vertical:7.h,horizontal: 15.w),
                                    decoration: BoxDecoration(
                                      color: CardIMG,
                                      borderRadius: BorderRadius.circular(20.r),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(-4.w, -4.h),
                                          blurRadius: 15.r,
                                          spreadRadius: 1.r,
                                        ),
                                        BoxShadow(
                                          color: Color(0xffC5D3FF),
                                          offset: Offset(4.w, 4.h),
                                          blurRadius: 15.r,
                                          spreadRadius: 1.r,
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            obj.updateCounting(cnt: foodCount, HowMany: int.parse(tak.text));
                                            tak.clear();
                                          },
                                          child: Container(
                                            width: 70.w,
                                            height: 30.h,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: Tile,
                                                borderRadius: BorderRadius.circular(5.r)
                                            ),
                                            child: Buttons('Calculate',White),
                                      ),
                                    ),
                                    Container(
                                      width: 100.w,height: 30.h,
                                      child:  Container(
                                          child: TextFormField(
                                            controller: tak,
                                            textAlignVertical: TextAlignVertical.bottom,
                                            style: TextStyle(color: Primary, fontSize: 18.sp, fontWeight: FontWeight.w600,),
                                            textAlign: TextAlign.start,
                                            decoration: InputDecoration(hintText: 'Your Take',
                                              hintStyle: TextStyle(color:Subtitle,fontSize: 13.sp,fontWeight: FontWeight.w400),
                                              contentPadding: EdgeInsets.only(bottom: 8.h),
                                              border: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFD8D8D8))),
                                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Primary)),
                                            ),
                                          )
                                      ),
                                    ),
                                    ItemSelectSubtitle(orI, Subtitle)
                                  ],
                                ),
                              ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                obj.addToCart(
                                    link: foodLink,
                                    name: foodName,
                                    calories: foodCalories,
                                    cnt: obj.counting
                                );
                                bx.addToListx();
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                height: 30.h,
                                decoration: BoxDecoration(
                                  color: Tile,
                                  borderRadius: BorderRadius.circular(7.r)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  SvgPicture.asset('lib/Media/Svg/CartAdd.svg',color: White,height: 12.h,),
                                  SizedBox(width: 5.w,),
                                  Buttons('add to cart'.toUpperCase(), White)
                                ],),
                              ),
                            )
                        ],),
                      )
                    ],),
                  ),)
            ),
          ),
        );
        }
        )
    );
  }
}

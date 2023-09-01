import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Changer/changeLogic.dart';
import '../../DataBase/DataBaseLogic.dart';
import '../../DataBase/DataBaseState.dart';
import '../../Widgets/Widgets.dart';
import '../../assets/Color2.dart';
import '../../assets/Text2.dart';




class Cart extends StatelessWidget {
  ChangeCartLogic dx = ChangeCartLogic();
  Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataBaseLogic()..createDateBase(),
      child: BlocConsumer<DataBaseLogic, DataBaseState>(
        listener: (context, state){},
        builder: (context, state){
          DataBaseLogic bx = BlocProvider.of(context);
          ChangeLaunchLogic cx = BlocProvider.of(context);
          return Scaffold(
            backgroundColor: Background,
            resizeToAvoidBottomInset: false,
            body: ScreenUtilInit(designSize: Size(360, 690),
                builder: (context, child) => SafeArea(
                  child: Container(
                    width: double.maxFinite,
                    child: Column(children: [
                      Row(
                        children: [
                          Container(
                            width: 320.w,height: 120.h,
                            decoration: BoxDecoration(
                              color: White,
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(75)),
                              boxShadow: [BoxShadow(color: Color(0x156F8FEA),offset: Offset(2.w, 10.h),blurRadius: 32.r)],),
                            child: Container(
                              padding: EdgeInsets.only(left:35.w),
                              child: Row(children: [
                                Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient:GR
                                    ),
                                    child: CircleAvatar(
                                      radius: 25.r,
                                      backgroundColor: Colors.transparent,
                                      child: SvgPicture.asset('lib/Media/Svg/Cart.svg',color: White,width: 20.w,),
                                    )
                                ),
                                SizedBox(width: 10.w,),
                                OrangeraTitle('Cart',Secondary),
                              ],),
                            ),
                          ),
                        ],
                      ),
                      Expanded(flex:7,child: Container(
                        padding: EdgeInsets.only(top: 20.h,left: 30.w,right: 30.w),
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: foodIn.length,
                            itemBuilder: (BuildContext context, int index){
                              return InkWell(
                                onTap: (){
                                  dx.deleteFromCart(index);
                                  bx.deleteFromListx();
                                },
                                child: ItemsCards(
                                    foodIn[index]['link'],
                                    foodIn[index]['name'],
                                    '${foodIn[index]['count']}'
                                ),
                              );
                            }
                        ),
                      )),
                      Expanded(flex:5,child: Container(
                        decoration: BoxDecoration(
                            color: CardIMG,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
                            boxShadow: [BoxShadow(
                              color: Color(0x265F7EC4),
                              offset: Offset(0,-7.h),
                              blurRadius: 10.r,
                            )]
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(40.w,20.w,40.w,0),
                          child: Column(children: [
                            CartCaloriesCheckOut('lib/Media/Svg/Kcal.svg','Total Currency', message),
                            SizedBox(height: 10.h,),
                            Container(
                              height: 40.h,
                              decoration: BoxDecoration(
                                  color: Tile,
                                  borderRadius: BorderRadius.circular(20.r)
                              ),
                              child: InkWell(
                                onTap: (){
                                  if(currentCurrencyx >= AllCount){
                                    dx.clearList();
                                    bx.updateCurrency(bx.db, currentCurrencyx);
                                    print('Current: $currentCurrencyx');
                                    // dx.updateCurrencyx(currentCurrencyx);
                                    cx.setLaunch();
                                  }
                                  else{
                                    dx.changeMessage();
                                    print('message : $message');
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset('lib/Media/Svg/Checkout.svg',color: White,height: 12.h,),
                                    SizedBox(width: 5.w,),
                                    Buttons('Check Out'.toUpperCase(), White)
                                  ],),
                              ),
                            )
                          ],),
                        ),
                      ))
                    ],),
                  ),)
            ),
          );
        },
      ),
    );
  }
}

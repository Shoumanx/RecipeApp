import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orangera/Changer/changeLogic.dart';
import 'package:orangera/DataBase/DataBaseLogic.dart';
import 'package:orangera/Screens/Splash/splashx.dart';
import '../DataBase/DataBaseState.dart';
import '../Widgets/Widgets.dart';
import '../assets/Color2.dart';
import '../assets/Text2.dart';


class Cart extends StatelessWidget {
  Cart({Key? key}) : super(key: key);
  FocusNode search = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataBaseLogic()..createDateBase(),
      child: BlocConsumer<DataBaseLogic, DataBaseState>(
        listener: (context, state){},
        builder: (context, state){
          ChangeCartLogic dx = BlocProvider.of(context);
          DataBaseLogic bx = BlocProvider.of(context);
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
                                      child: SvgPicture.asset('lib/Media/Svg/Item.svg',color: White,width: 20.w,),
                                    )
                                ),
                                SizedBox(width: 10.w,),
                                OrangeraTitle('Cart',Secondary),
                              ],),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 20.h,),
                      SizedBox(
                        width: 360.w,height: 400.h,
                        child: Stack(children: [
                          Container(
                            alignment: Alignment.center,
                            width: 360.w,height: 400.h,
                            child: ListView.builder(
                                itemCount: foodInCart.length,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                padding: EdgeInsets.all(40.w),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: (){
                                      dx.deleteFromCart(index);
                                    },
                                    child: ItemCards(
                                        'lib/Media/ItemsPng/italiano pasta ziti.png',
                                        foodInCart[index]['name'],
                                        foodInCart[index]['calories']
                                        ,'${foodInCart[index]['count']}\$'),
                                  );
                                }
                            ),
                          ),
                          Container(
                            child: txt(x: message),
                          ),
                          SizedBox(height: 20.h,),
                          Container(
                            child: MaterialButton(
                              onPressed: (){
                                dx.clearList();
                                bx.updateCurrency(bx.db, currentCurrency);
                                bx.showWhat(bx.db, 'currentCurrency').then((value) {
                                  List xx = value;
                                  print(xx);
                                });
                              },
                              child: txt(x: 'checkOut'),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            child: Container(
                              width: 360.w,height: 20.h,
                              decoration: BoxDecoration(
                                  gradient: HideU
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              width: 360.w,height: 20.h,
                              decoration: BoxDecoration(
                                  gradient: HideD
                              ),
                            ),
                          ),
                        ],),
                      )
                    ],),
                  ),)
            ),
          );
        },
      ),
    );
  }
}



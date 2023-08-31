import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orangera/Changer/changeLogic.dart';
import 'package:orangera/Changer/changeState.dart';
import 'package:orangera/Screens/Splash/splashx.dart';
import '../Widgets/Widgets.dart';
import '../assets/Color2.dart';
import '../assets/Text2.dart';


class AddOrNo extends StatelessWidget {
  String foodLink = '', foodName = '', foodCalories = '', orI = '';
  int foodCount = 0;
  AddOrNo({Key? key, required this.foodLink, required this.foodCalories, required this.foodCount, required this.foodName, required this.orI}) : super(key: key);
  FocusNode search = FocusNode();

  @override
  Widget build(BuildContext context) {
    TextEditingController taked = TextEditingController();
    return BlocProvider(
      create: (context) => ChangeCartLogic(),
      child: BlocConsumer<ChangeCartLogic, ChangeCartState>(
        listener: (context, state){},
        builder: (context, state){
          ChangeCartLogic obj = BlocProvider.of(context);
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
                                OrangeraTitle('Add',Secondary),
                              ],),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      Container(
                        width: 320.w,height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          color: Highlight,
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      SizedBox(
                        width: 360.w,height: 400.h,
                        child: Stack(children: [
                          Container(
                            alignment: Alignment.center,
                            width: 360.w,height: 400.h,
                            child: ListView(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                padding: EdgeInsets.all(40.w),
                                children: [
                                InkWell(
                                onTap: (){
                                  obj.addToCart(link: foodLink,
                                      name: foodName,
                                      calories: foodCalories,
                                      cnt: obj.counting);
                                  },
                                    child: ItemCards(
                                        foodLink,
                                        foodName,
                                        foodCalories,
                                        '$foodCount'),
                                  )
                                ],
                            ),
                          ),
                          Container(
                            width: 320.w,height: 50.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10.r)),
                              color: Highlight,
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                            child: Row(children: [
                              Expanded(
                                  flex: 4,
                                  child: TextFormField(
                                    controller: taked,
                                    focusNode: search,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Background,
                                        contentPadding: EdgeInsets.fromLTRB(10,0,10,0),
                                        hintText: 'Search For Items',
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.r),
                                            borderSide: BorderSide.none
                                        )
                                    ),
                                  )
                              ),
                              SizedBox(width: 10.w,),
                              txt(x: orI),
                              SizedBox(width: 20.w,),
                              txt(x: '${obj.counting}'),
                              InkWell(
                                onTap: (){
                                  obj.updateCounting(cnt: foodCount, HowMany: int.parse(taked.text));
                                },
                                child: txt(x: 'click'),
                              )
                            ],),
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



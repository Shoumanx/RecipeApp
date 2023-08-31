import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../DataBase/DataBaseLogic.dart';
import '../../DataBase/DataBaseState.dart';
import '../../DataBase/foodinsertion.dart';
import '../../Widgets/Widgets.dart';
import '../../assets/Color2.dart';
import '../../assets/Text2.dart';
import 'Add.dart';


class ItemSelect extends StatelessWidget {
  ItemSelect({Key? key}) : super(key: key);
  FocusNode search = FocusNode();

  @override
  Widget build(BuildContext context) {
    TextEditingController searched = TextEditingController();
    return BlocProvider(
      create: (context) => DataBaseLogic()..createDateBase(),
      child: BlocConsumer<DataBaseLogic, DataBaseState>(
        listener: (context, state){},
        builder: (context, state){
          DataBaseLogic dx = BlocProvider.of(context);
          if(dx.selectedFood.length == 0)   dx.selectedFood = foodx;
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
                                OrangeraTitle('Item Select',Secondary),
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
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                        child: Row(children: [
                          Expanded(
                              flex: 4,
                              child: TextFormField(
                                controller: searched,
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
                          SizedBox(width: 20.w,),
                          InkWell(
                            onTap: (){
                              dx.search(x: dx.db, category: 'food', name: searched.text);
                            },
                            child: Container(
                              width:35.w ,height: 30.h,
                              padding: EdgeInsets.all(7.w),
                              decoration: BoxDecoration(
                                  color: Background,
                                  borderRadius: BorderRadius.circular(5.r)
                              ),
                              child: SvgPicture.asset('lib/Media/Svg/Search.svg',
                                color: Primary,),
                            ),
                          )
                        ],),
                      ),
                      SizedBox(height: 20.h,),
                      SizedBox(
                        width: 360.w,height: 400.h,
                        child: Stack(children: [
                          Container(
                            alignment: Alignment.center,
                            width: 360.w,height: 400.h,
                            child: ListView.builder(
                              itemCount: dx.selectedFood.length,
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              padding: EdgeInsets.all(40.w),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                        MaterialPageRoute(builder: (context) => Add(
                                          foodLink: 'lib/Media/ItemsPng/${dx.selectedFood[index]['name']}.png',
                                          foodCalories: dx.selectedFood[index]['calories'],
                                          foodCount: dx.selectedFood[index]['count'],
                                          foodName: dx.selectedFood[index]['name'],
                                          orI: dx.selectedFood[index]['gmORml'],
                                        )
                                        )
                                    );
                                  },
                                  child: ItemCards(
                                      'lib/Media/ItemsPng/${dx.selectedFood[index]['name']}.png',
                                      dx.selectedFood[index]['name'],
                                      dx.selectedFood[index]['calories']
                                      ,'${dx.selectedFood[index]['price']}£'),
                                );
                              }
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



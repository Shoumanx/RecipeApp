import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:temp/Screens/Item_Select.dart';
import '../Screens/Home.dart';


class BottomNavController extends GetxController{
  RxInt index= 0.obs;

  var Pages=[
    Home(),
    ItemSelect(),
  ];
}
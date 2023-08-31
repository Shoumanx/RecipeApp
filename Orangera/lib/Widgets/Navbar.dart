
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:orangera/Screens/Home/Cart.dart';
import '../Screens/Home/Home.dart';
import '../Screens/Home/Item_Select.dart';



class BottomNavController extends GetxController{
  RxInt index= 0.obs;
  var Pages=[
    Home(),
    ItemSelect(),
    Cart(),
  ];
}
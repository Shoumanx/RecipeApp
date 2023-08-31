
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:orangera/Screens/cart.dart';
import '../Screens/Home.dart';



class BottomNavController extends GetxController{
  RxInt index= 0.obs;
  var Pages=[
    Home(),
    Cart(),
  ];
}
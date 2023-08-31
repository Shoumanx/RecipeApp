import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:orangera/Colors/Colors.dart';
import 'changeState.dart';


class ChangeLogic extends Cubit<ChangeState>{
  Color lose = Primary;
  Color maintain = Primary;
  Color gain = Primary;
  String RadioState = '';

  ChangeLogic() : super(InitColor());

  changeColorLose(){
    lose = Color(0xffa7c957);
    gain = Primary;
    maintain = Primary;
    emit(SetColorLose());
  }
  changeColorMain(){
    maintain = Color(0xffa7c957);
    gain = Primary;
    lose = Primary;
    emit(SetColorMain());
  }

  changeColorGain(){
    gain = Color(0xffa7c957);
    lose = Primary;
    maintain = Primary;
    emit(SetColorGain());
  }

  changeRadioState(){
    emit(ChangeRadioState());
  }
}


List foodInCart = [];
String message = '0';
int AllCount = 0, currentCurrency = 0;

class ChangeCartLogic extends Cubit<ChangeCartState>{
  int counting = 0;
  ChangeCartLogic() : super(InitCart());

  addToCart({required String link, required String name, required String calories, required int cnt}){
    foodInCart.add(
      {
        'link' : link,
        'name' : name,
        'calories' : calories,
        'count' : cnt
      }
    );
    AllCount += cnt;
    message = AllCount.toString();
    print('Item Added....');
    emit(SetList());
  }

  deleteFromCart(int index){
    int x = foodInCart[index]['count'];
    AllCount -= x;
    message = AllCount.toString();
    foodInCart.removeAt(index);
    emit(DeleteFromList());
  }


  ChangeMessage(){
    message = 'Finish';
    emit(SetString());
  }

  clearList(){
    print('Currentxxx: $currentCurrency');
    currentCurrency -= AllCount;
    print('Currentxxx: $currentCurrency');
    AllCount = 0;
    message = '0';
    foodInCart.clear();
    emit(ClearList());
  }

  updateCounting({required int cnt, required int HowMany}){
    counting = ((cnt / 100) * HowMany).toInt();
    emit(UpdateCount());
  }
}
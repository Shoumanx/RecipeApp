import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:orangera/Colors/Colors.dart';
import 'package:orangera/Run.dart';
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
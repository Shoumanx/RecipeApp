import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:orangera/Screens/Onboard/Onboard.dart';
import 'package:orangera/DataBase/StartDataBase.dart';

import '../../DataBase/DataBaseLogic.dart';
import '../../DataBase/DataBaseState.dart';
import 'Program.dart';
List xy = [];
class Splashx extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataBaseLogic()..createDateBase(),
      child: BlocConsumer<DataBaseLogic, DataBaseState>(
        listener: (context, state){},
        builder: (context, state){
          DataBaseLogic obj = BlocProvider.of(context);
          return Scaffold(
            appBar: AppBar(),
            body: Container(
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  // obj.UpdateIsIntro(1, 'IsIntro');
                  // obj.showWhat(obj.db, 'food').then((value) {
                  //   intro = value;
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => showx(intro)),
                  //   );
                  // });
                  // xy = obj.food;
                  // print(obj.IsIntro);
                  // Get the current date and time
                  DateTime now = DateTime.now();

                  // Format the date as per your requirement
                  String currentDate = DateFormat('yyyy-MM-dd').format(now);
                  // String currentDate = '2023-08-29';
                  print('now: $now \t\t\t currentDate: $currentDate');
                  print(obj.IsIntro);
                  if(obj.IsIntro == 0){
                    obj.insert(category: 'date', name: currentDate, calories: '', price: '', count: 1, gmORml: '');
                    obj.insert(category: 'IsIntro', name: 'IsIntro', calories: '', price: '', count: 1, gmORml: '');
                    insertFood(obj);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Onboard(x: obj)),
                    );
                  }
                  else if(obj.IsIntro == 1){
                    print('from splashx: ${obj.savedDate}');
                    print('the date Before Update: ${obj.savedDate}');
                    if(currentDate != obj.savedDate){
                      obj.updateDate(currentDate);
                    }
                    print('the date After Update: ${obj.savedDate}');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Showx(fullName: obj.fullName, currency: obj.currentCurrency)),
                    );
                    // obj.UpdateIsIntro(1, 'IsIntro');
                  }
                  // print('IsIntro is ${obj.IsIntro}\n');
                  // obj.showWhat(obj.db, 'IsIntro').then((value) {
                  //   intro = value;
                  //   IsIntro = intro[0]['count'];
                  //   print(intro);
                  //   print('IsIntro is $IsIntro\n');
                  //   if(IsIntro == 1){
                  //
                  //   }
                  //   else  print('Card...');
                  // });
                  // obj.insert(category: 'IsIntro', name: 'IsIntro', calories: '', price: '', count: 1, gmORml: '');
                  // obj.insert(category: 'food', name: 'Apple', calories: '500', price: '500', count: 8);
                  // obj.insert(category: 'food', name: 'Orange', calories: '500', price: '300', count: 5);
                  // obj.insert(category: 'food', name: 'Banana', calories: '500', price: '400', count: 15);
                  // obj.deleteRow('counter');
                },
                elevation: 15,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    txt(x: 'Splash'),
                  ],
                ),
                color: Colors.amberAccent,
              ),
            ),
          );
        },
      ),
    );
  }
}


Widget txt({required String x, clr = Colors.black, double sz = 15, TextAlign ta = TextAlign.start})
=> Text(
  x,
  style: TextStyle(
      color: clr,
      fontSize: sz
  ),
  textAlign: ta,
);


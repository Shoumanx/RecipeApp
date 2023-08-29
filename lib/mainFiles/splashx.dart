import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/DataBase/DataBaseLogic.dart';
import 'package:project/Intro/Intro.dart';
import 'package:project/Program.dart';

import 'DataBase/DataBaseState.dart';
class Splashx extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataBaseLogic()..createDateBase(),
      child: BlocConsumer<DataBaseLogic, DataBaseState>(
        listener: (context, state){},
        builder: (context, state){
          DataBaseLogic obj = BlocProvider.of(context);
          List intro = [];
          int IsIntro = 0;
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
                  xy = obj.food;
                  if(obj.IsIntro == 1){
                    obj.UpdateIsIntro(2, 'IsIntro');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Intro()),
                    );
                  }
                  else if(obj.IsIntro == 2){
                    // obj.UpdateIsIntro(1, 'IsIntro');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Showx()),
                    );
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
                  // obj.insert(category: 'IsIntro', name: 'IsIntro', calories: '', price: '', count: 1);
                  obj.insert(category: 'food', name: 'Apple', calories: '500', price: '500', count: 8);
                  obj.insert(category: 'food', name: 'Orange', calories: '500', price: '300', count: 5);
                  obj.insert(category: 'food', name: 'Banana', calories: '500', price: '400', count: 15);
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


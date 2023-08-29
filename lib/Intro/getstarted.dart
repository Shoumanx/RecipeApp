import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/DataBase/DataBaseLogic.dart';
import 'package:project/Program.dart';
import '../DataBase/DataBaseState.dart';
import '../splashx.dart';
class St extends StatelessWidget {
  String cur = '';
  St(this.cur);
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
              child: Column(
                children: [
                  txt(x: cur),
                  MaterialButton(
                    onPressed: () {
                      obj.insert(category: 'currency', name: 'currency', calories: '', price: '', count: double.parse(cur).toInt());
                      obj.showWhat(obj.db, 'currency').then((value) {
                        List x = value;
                        print('\n\n\n $x \n\n\n');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Showx()),
                        );
                      });

                    },
                    elevation: 15,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        txt(x: 'GetStarted'),
                      ],
                    ),
                    color: Colors.amberAccent,
                  ),
                ],
              )
            ),
          );
        },
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orangera/Screens/Splash/splashx.dart';
import '/../DataBase/DataBaseLogic.dart';
import '../../DataBase/DataBaseState.dart';
TextEditingController search = TextEditingController();
List xyz = [];
class Searchx extends StatelessWidget {
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
                  feild(search, '', 'Search', Icon(Icons.search)),
                  MaterialButton(
                    onPressed: () {
                      obj.search(x: obj.db, category: 'food', name: search.text);
                      // obj.showWhat(obj.db, 'food').then((value) {
                      //   xyz = value;
                      // });
                      },
                    elevation: 15,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        txt(x: 'Search'),
                      ],
                    ),
                    color: Colors.amberAccent,
                  ),
                  Container(
                    height: 630,
                    child: ListView.builder(
                        itemCount: obj.selectedFood.length,
                        itemBuilder: (BuildContext context, int index){
                          return   Card(
                            child: ListTile(
                              title: txt(x: obj.selectedFood[index]['name'], clr: Colors.black),
                              subtitle: txt(x: obj.selectedFood[index]['calories'].toString()),
                              trailing: txt(x: obj.selectedFood[index]['price']),
                            ),
                          );
                        }
                    ),
                  )
                ],
              )
            ),
          );
        },
      ),
    );
  }
}


Widget feild(TextEditingController x, String hint, String label, Icon icn) => Padding(
  padding: const EdgeInsets.only(bottom: 15.0, left: 5, right: 5),
  child: TextField(
    controller: x,
    decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        hintText: hint,
        icon: icn,
        labelText: label
    ),
  ),
);



import 'package:flutter/material.dart';
import 'package:orangera/Screens/Splash/splashx.dart';

List xy = [];
class Showx extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: txt(x: 'Users List', clr: Colors.black, sz: 25),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Container(
        color: Colors.amberAccent,
        width: double.infinity,
        child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                MaterialButton(
                  onPressed: () {

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
                    itemCount: xy.length,
                    itemBuilder: (BuildContext context, int index){
                        return   Card(
                          child: ListTile(
                            title: txt(x: xy[index]['name'], clr: Colors.black),
                            subtitle: txt(x: xy[index]['count'].toString()),
                            trailing: txt(x: xy[index]['price']),
                          ),
                        );
                      }
                  ),
                )
              ],
            )
        ),
      )
  );
  }
}

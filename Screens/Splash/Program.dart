
import 'package:flutter/material.dart';
import 'package:orangera/Screens/Splash/search.dart';
import 'package:orangera/Screens/Splash/splashx.dart';

List xy = [];
class Showx extends StatelessWidget {
  int currency = 0;
  String fullName = '';
  Showx({required this.currency, required this.fullName});
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: txt(x: 'Home List', clr: Colors.black, sz: 25),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Searchx()),
                    );
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
                Card(
                  child: ListTile(
                    title: txt(x: fullName, clr: Colors.black),
                    subtitle: txt(x: currency.toString()),
                  ),
                )
              ],
            )
        ),
      )
  );
  }
}

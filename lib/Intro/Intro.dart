import 'package:flutter/material.dart';
import 'package:project/Intro/kgcm.dart';
import 'package:project/search/search.dart';
import 'package:project/splashx.dart';
int weight = 0, height = 0, age = 0;
double currency = 0;
String gender = '', xlgm = '';

class Intro extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: txt(x: 'Intro'),
            ),
            body: Container(
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Kgcm()),
                  );
                },
                elevation: 15,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    txt(x: 'Get Started'),
                  ],
                ),
                color: Colors.amberAccent,
              ),
            ),
          );
  }
}




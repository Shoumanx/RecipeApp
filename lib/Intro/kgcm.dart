import 'package:flutter/material.dart';
import 'package:project/Intro/Intro.dart';
import 'package:project/splashx.dart';

import 'getstarted.dart';


class Kgcm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    TextEditingController kg = TextEditingController();
    TextEditingController cm = TextEditingController();
    TextEditingController year = TextEditingController();
    TextEditingController gen = TextEditingController();
    TextEditingController lgm = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: txt(x: 'Intro'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            feild(kg, '', 'Weight', Icon(Icons.search)),
            feild(cm, '', 'Height', Icon(Icons.search)),
            feild(year, '', 'Age', Icon(Icons.search)),
            feild(gen, '', 'Gender(M, F)', Icon(Icons.search)),
            feild(lgm, '', 'L, G, M', Icon(Icons.search)),
            MaterialButton(
              onPressed: ()  {
                weight = int.parse(kg.text);
                height = int.parse(cm.text);
                age = int.parse(year.text);
                gender = gen.text;
                xlgm = lgm.text;
                formula();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => St(currency.toString())),
                );
              },
              elevation: 15,
              child: txt(x: 'ShowData'),
              color: Colors.amberAccent,
            ),
          ],
        )
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



formula(){
  if(gender == 'M'){
    currency = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
  }
  else{
    currency = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
  }
  if(xlgm == 'L')   currency -= 500;
  else if(xlgm == 'G')   currency += 500;
}
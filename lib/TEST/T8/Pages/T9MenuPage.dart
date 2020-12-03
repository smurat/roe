import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'T9MainPage.dart';


class TESTT9MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MENU'),
      ),
      body: Column(
        children: [
          RaisedButton(
            onPressed: () {Get.to(TESTT9MainPage());},
            child: Icon(Icons.ac_unit),
          ),
          RaisedButton(
            onPressed: () {
              
            },
            child: Icon(Icons.accessibility_rounded),
          ),
          RaisedButton(
            onPressed: () {},
            child: Icon(Icons.access_alarm),
          )
        ],
      ),
    );
  }
}

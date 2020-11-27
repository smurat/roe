import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:son_roe/parts/T8/Controller/T9Controller.dart';

class TESTT9MainPage extends StatelessWidget {
  TestT9Controller controller = Get.put(TestT9Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MAIN'),
      ),
      body: Column(
        children: [
          RaisedButton(
            onPressed: () {
              controller.arttir(1, 0);
              print(controller.myMap1['cavalrylv']['cavalryRecruimentLv']);
            },
          )
        ],
      ),
    );
  }
}

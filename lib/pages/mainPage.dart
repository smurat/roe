import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:son_roe/parts/t9calculator/t9mainpage.dart';


import 'package:son_roe/widgets/customMenuButton.dart';

class MainPage extends StatelessWidget {
  MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF222222),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('MainPage'),
          ),
          body: Center(
            child: Column(
              children: [
                CustomMenuButton(
                    onPressed: () {
                      Get.to(T9CalculatorPage());
                    },
                    buttonTitle: 'T9 Calculator'),
                CustomMenuButton(
                    onPressed: () {
                      Get.to(T9CalculatorPage());
                    },
                    buttonTitle: 'null-1'),
                CustomMenuButton(onPressed: () {}, buttonTitle: 'null-1'),
                CustomMenuButton(onPressed: () {}, buttonTitle: 'null-1'),
              ],
            ),
          )),
    );
  }
}

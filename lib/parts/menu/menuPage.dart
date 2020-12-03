import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:son_roe/parts/t9calculator/t9menupage.dart';

import 'widgets/customMenuButton.dart';

class MenuPage extends StatelessWidget {
  MenuPage({Key key}) : super(key: key);

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
                      Get.to(T9ManuPage());
                    },
                    buttonTitle: 'T9 Calculator'),
                CustomMenuButton(
                    onPressed: () {
                     
                    },
                    buttonTitle: 'Coming soon'),
                CustomMenuButton(onPressed: () {}, buttonTitle: 'Coming soon'),
                CustomMenuButton(onPressed: () {}, buttonTitle: 'Coming soon'),
              ],
            ),
          )),
    );
  }
}

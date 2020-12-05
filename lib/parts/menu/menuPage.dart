import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:son_roe/parts/t9calculator/pages/t9menupage/1-t9menupage.dart';

import 'widgets/customMenuButton.dart';

class MenuPage extends StatelessWidget {
  MenuPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF222222),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 36),
                    child: Center(
                        child: Text(
                      'RISE OF EMPIRES ICE AND FIRE',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    )),
                  ),
                  CustomMenuButton(
                      onPressed: () {
                        Get.to(T9ManuPage());
                      },
                      buttonTitle: 'T9 Calculator'),
                  CustomMenuButton(
                      onPressed: () {}, buttonTitle: 'Coming soon'),
                  CustomMenuButton(
                      onPressed: () {}, buttonTitle: 'Coming soon'),
                  CustomMenuButton(
                      onPressed: () {}, buttonTitle: 'Coming soon'),
                ],
              ),
            )),
      ),
    );
  }
}

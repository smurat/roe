import 'package:flutter/material.dart';
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
                    onPressed: () {}, buttonTitle: 'T9 Calculator'),
                CustomMenuButton(onPressed: () {}, buttonTitle: 'null-1'),
                CustomMenuButton(onPressed: () {}, buttonTitle: 'null-1'),
                CustomMenuButton(onPressed: () {}, buttonTitle: 'null-1'),
              ],
            ),
          )),
    );
  }
}

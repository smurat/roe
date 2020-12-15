import 'package:flutter/material.dart';

class BottomSide extends StatelessWidget {
  const BottomSide({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          
        },
      ),
    ));
  }
}

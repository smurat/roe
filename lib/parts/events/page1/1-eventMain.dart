import 'package:flutter/material.dart';

import 'widgets/bottomSide.dart';
import 'widgets/middleSide.dart';
import 'widgets/topSide.dart';

class EventMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: Column(
        children: [
          TopSide(),
          MiddleSide(),
          BottomSide(),
        ],
      ),
    );
  }
}





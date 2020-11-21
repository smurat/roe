import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TestDosyasi extends StatefulWidget {
  @override
  _TestDosyasiState createState() => _TestDosyasiState();
}

class _TestDosyasiState extends State<TestDosyasi> {
  var i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              i++;
            });
          },
        ),
        appBar: AppBar(
          title: Text('TEST'),
        ),
        body: Center(
            child: CircularPercentIndicator(
              radius: 200,
              lineWidth: 15,
              percent: i*0.1,
              center: Text('$i'),
              animation: true,
            )));
  }
}

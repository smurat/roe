import 'package:flutter/material.dart';
import 'package:son_roe/events/utility/services_event.dart';

class GatheringMainPage extends StatefulWidget {
  @override
  _GatheringMainPageState createState() => _GatheringMainPageState();
}

class _GatheringMainPageState extends State<GatheringMainPage> {
  Map<String, dynamic> mapA = {
    '6-8': 0,
    '9-10': 1,
    '11-13': 2,
    '14-16': 3,
    '17-19': 4,
    '20-22': 5,
    '23-24': 6,
    '25': 7,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: RaisedButton(onPressed: () {
        _ccc();
      }),
    ));
  }

  List<DropdownMenuItem> _ccc() {
    List<DropdownMenuItem> liste = List();
    mapA.forEach((key, value) {
      liste.add(DropdownMenuItem(child: Text(('$key')), value: value));
    });
  }
}

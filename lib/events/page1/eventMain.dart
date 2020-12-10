import 'dart:async';

import 'package:flutter/material.dart';
import 'package:son_roe/parts/t9calculator/utility/services_t9.dart';
import 'package:time_machine/time_machine.dart';

import 'widgets/bottomSide.dart';
import 'widgets/middleSide.dart';
import 'widgets/topSide.dart';

class EventMainPage extends StatelessWidget {
  const EventMainPage({
    Key key,
    @required Timer timer,
  })  : _timer = timer,
        super(key: key);
  final _timer;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print('object');
        _timer.cancel();
        return true;
      },
      child: Scaffold(
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
      ),
    );
  }
}

/*
  Future<List> _getGameTime() async {
    try {
      var tzdb = await DateTimeZoneProviders.tzdb;
      var noronha = await tzdb['America/Noronha'];
      var now = Instant.now();

      //print('1-> Noronha ====> ${now.inZone(noronha).clockTime}');
      //  print('2-> DayOfWeek ${now.inZone(noronha).dayOfWeek}');
      //  print('2-> Hour ${now.inZone(noronha).hourOfDay}');
      //  print('2-> LocalTime ${now.inLocalZone()}');

      return [noronha, now];
    } catch (e) {
      print('HATA' + e);
      return [];
    }
  }*/

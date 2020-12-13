import 'dart:async';

import 'package:flutter/material.dart';
import 'package:son_roe/events/model_events.dart';
import 'package:son_roe/parts/t9calculator/utility/services_t9.dart';

import 'widgets/bottomSide.dart';
import 'widgets/middleSide.dart';
import 'widgets/topSide.dart';

class EventMainPage extends StatelessWidget {
  const EventMainPage({
    Key key,
    @required Timer timer,
    @required ModelEvents model,
  })  : _timer = timer,
        _eventModel = model,
        super(key: key);
  final _timer;
  final _eventModel;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print('timer closed');        
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
            TopSide(model: _eventModel,),
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

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:son_roe/events/model_events.dart';
import 'package:son_roe/events/page1/controllertime.dart';
import 'package:son_roe/events/page1/eventMain.dart';

import 'package:son_roe/parts/gathering/main_gather.dart';
import 'package:son_roe/parts/t9calculator/pages/t9menupage/t9menupage.dart';
import 'package:son_roe/parts/zoneconflict/main_zoneconflict.dart';

import 'package:time_machine/time_machine.dart';

import 'locator.dart';
import 'parts/menu/widgets/customMenuButton.dart';

class MenuPage extends StatelessWidget {
  Timer _timer;
  bool isTimerOn = true;
  ZonedDateTime _zonedDateTime;
  LocalTime _currentTime;
  LocalTime _reverseTime;

  ControllerServerTime _controller = Get.find<ControllerServerTime>();

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
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    )),
                  ),
                  CustomMenuButton(
                      onPressed: () {
                        Get.to(T9ManuPage());
                      },
                      buttonTitle: 'T9 Calculator'),
                  CustomMenuButton(
                      onPressed: () {
                        Get.to(ZoneConflictMainPage());
                      },
                      buttonTitle: 'Zone Conflict'),
                  CustomMenuButton(
                      onPressed: ()  {
                        //  Get.to(GatheringMainPage());

                        //---------TEST AREA ---------//
                        
                        //---------TEST AREA ---------//
                      },
                      buttonTitle: 'Gather'),
                  CustomMenuButton(
                      onPressed: () async {
                        _zonedDateTime = await _fetchServerTime();
//FIXME START TIMER
                        _startTimer();
                        Get.to(EventMainPage(
                            timer: _timer, model: _controller.modelList));
                      },
                      buttonTitle: 'Events'),
                ],
              ),
            )),
      ),
    );
  }

  _startTimer() async {
    _currentTime = _zonedDateTime.clockTime; // Assigning hh:mm:ss

    _reverseTime = LocalTime(0, (60 - _currentTime.minuteOfHour),
        (60 - _currentTime.secondOfMinute));

    int day = _zonedDateTime.dayOfWeek.value;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _currentTime = _currentTime.addSeconds(1);
      _reverseTime = _reverseTime.subtractSeconds(1);
    
      _controller.updateTime(
          localTime: _currentTime, reverseTime: _reverseTime,day: day);
    });
  }

  /// Returns Server Time
  Future<ZonedDateTime> _fetchServerTime() async {
    try {
      var tzdb = await DateTimeZoneProviders.tzdb;
      var noronha = await tzdb['America/Noronha'];
      var now = Instant.now();

      return now.inZone(noronha); //11:52:29

    } catch (e) {
      print('HATA :> ' + e);
      return null;
    }
  }
}

/*
 
  Future<ModelEvents> _fetchJsonData(BuildContext context) async {
    /*  String jsonData =
        await DefaultAssetBundle.of(context).loadString('assets/events.json');*/

    String jsonData = await rootBundle.loadString('assets/events.json');

    final res = json.decode(jsonData);
    ModelEvents model = ModelEvents.fromMap(res);
    // print(model.weekday[0].daycontents[0].eventtitle);
    return model;
  }
 */

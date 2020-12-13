import 'dart:convert';

import 'package:son_roe/events/model_events.dart';
import 'package:son_roe/events/page1/model_time.dart';
import 'package:son_roe/parts/t9calculator/utility/services_t9.dart';
import 'package:time_machine/time_machine.dart';
import 'package:flutter/services.dart' show rootBundle;

class ControllerServerTime extends GetxController {
  final model = ModelServerTime(serverTime: LocalTime(0, 0, 0), day: 0).obs;
  ModelEvents modelList;
  final sunday = 0.obs;

  updateTime({LocalTime localTime, LocalTime reverseTime, int day}) {
    model.update((val) {
      val.sec = localTime.secondOfMinute;
      val.min = localTime.minuteOfHour;
      val.hr = _dateAdjustment(localTime.hourOfDay);
      val.nextEventHr = _dateAdjustment(localTime.hourOfDay + 1);
      val.serverTime = localTime;
      val.reverse = reverseTime;
      val.day = day;
    });
  }

  int _dateAdjustment(int hr) {
    return hr == 8 || hr == 16
        ? 0
        : (hr == 9 || hr == 17)
            ? 1
            : (hr == 10 || hr == 18)
                ? 2
                : (hr == 11 || hr == 19)
                    ? 3
                    : (hr == 12 || hr == 20)
                        ? 4
                        : (hr == 13 || hr == 21)
                            ? 5
                            : (hr == 14 || hr == 22)
                                ? 6
                                : (hr == 15 || hr == 23)
                                    ? 7
                                    : hr;
  }

  _dayAdjustment(int day) {}

  _fetchJsonData() async {
    String jsonData = await rootBundle.loadString('assets/events.json');

    final res = json.decode(jsonData);
    modelList = ModelEvents.fromMap(res);
    print('ControllerServerTime: Json oluşturuldu');
  }

  @override
  void onInit() {
    super.onInit();
    _fetchJsonData();
  }
}

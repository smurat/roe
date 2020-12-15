import 'package:son_roe/events/utility/services_event.dart';
import 'package:son_roe/parts/t9calculator/utility/services_t9.dart';

import 'package:time_machine/time_machine.dart';
import 'package:flutter/services.dart' show rootBundle;

class ControllerServerTime extends GetxController {
  final model = ModelServerTime(serverTime: LocalTime(0, 0, 0), day: 0).obs;
  ModelEvents modelList;
  final sunday = 0.obs; //kullanıcının Seçtiği Gün

  updateTime({LocalTime localTime, LocalTime reverseTime, int day}) {
    model.update((val) {
      // Not: Her sn Güncellenir
      val.sec = localTime.secondOfMinute;
      val.min = localTime.minuteOfHour;
      val.hr = _hourAdjustment(localTime.hourOfDay);
      val.nextEventHr = _hourAdjustment(localTime.hourOfDay + 1);
      val.serverTime = localTime;
      val.reverse = reverseTime;
      val.day = _sundayAdjustment(day);
    });
  }

  int _hourAdjustment(int hr) => hr == 8 || hr == 16
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

  _sundayAdjustment(int day) => day == 6 ? sunday : day;

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

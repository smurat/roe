import 'package:son_roe/events/page1/model_time.dart';
import 'package:son_roe/parts/t9calculator/utility/services_t9.dart';
import 'package:time_machine/time_machine.dart';

class ControllerServerTime extends GetxController {
  final model = ModelServerTime(serverTime: LocalTime(0, 0, 0)).obs;

  updateTime({LocalTime localTime, LocalTime reverseTime}) {
    model.update((val) {
      val.sec = localTime.secondOfMinute;
      val.min = localTime.minuteOfHour;
      val.hr = localTime.hourOfDay;
      val.serverTime = localTime;
      val.reverse = reverseTime;
    });
  }
}

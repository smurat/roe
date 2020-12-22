import 'package:son_roe/events/utility/models/model_chest.dart';
import 'package:son_roe/events/utility/services_event.dart';
import 'package:time_machine/time_machine.dart';

class ControllerServerTime extends GetxController {
  final model = ModelServerTime(serverTime: LocalTime(0, 0, 0), day: 0).obs;

  final sunday = 0.obs; //kullanıcının Seçtiği Gün
  final modelEventContent = ModelEventContentList([]).obs;
  final listOfChest = ModelChests([]).obs;
  ModelEvents eventModelJsonData;

  updateTime({LocalTime localTime, LocalTime reverseTime, int day}) {
    model.update((val) {
      // Not: Her sn Güncellenir
      val.sec = localTime.secondOfMinute;
      val.min = localTime.minuteOfHour;
      val.hr = _hourAdjustment(localTime.hourOfDay);
      val.nextEventHr = _hourAdjustment(localTime.hourOfDay + 1);
      val.serverTime = localTime;
      val.reverse = reverseTime;
      

      modelEventContent.update((value) {
        value.eventList = eventModelJsonData
            .weekday[val.day].daycontents[val.hr].eventContent;
      });

      listOfChest.update((value) {
        value.castleLv =
            eventModelJsonData.weekday[val.day].daycontents[val.hr].castlelv;
      });
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

  

  @override
  void onInit() async {
    super.onInit();

    RepositoryClass repo = getIt<RepositoryClass>();
    repo.fetchJsonData().then((value) {
      eventModelJsonData = value;
    });
  }
}

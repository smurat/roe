import 'dart:developer';

import 'package:son_roe/events/utility/services_event.dart';
import 'package:time_machine/time_machine.dart';
import 'parts/menu/widgets/customMenuButton.dart';

// ignore: must_be_immutable
class MenuPage extends StatelessWidget {
  Timer _timer;
  bool isTimerOn = true;
  ZonedDateTime _zonedDateTime;
  LocalTime _currentTime;
  LocalTime _reverseTime;
  int day;

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
                      onPressed: () {
                        //  Get.to(GatheringMainPage());

                        //---------TEST AREA ---------//

                        //---------TEST AREA ---------//
                      },
                      buttonTitle: 'Gather'),
                  CustomMenuButton(
                      onPressed: () async {
                        _zonedDateTime = await _fetchServerTime();
                        _initEventPage();
                        Get.to(EventMainPage(
                          timer: _timer,
                          eventModel: _controller.modelList,
                          contentList: _controller
                              .modelList
                              .weekday[_zonedDateTime.dayOfWeek.value - 1]
                              .daycontents[_controller.model.value.hr]
                              .eventContent,
                        ));
                      },
                      buttonTitle: 'Events'),
                ],
              ),
            )),
      ),
    );
  }

  _initEventPage() async {
    print(Timeline.now.milliseconds);
    _currentTime = _zonedDateTime.clockTime; // Assigning hh:mm:ss

    _reverseTime = LocalTime(0, (59 - _currentTime.minuteOfHour),
        (60 - _currentTime.secondOfMinute)); // Kalan süre

    // Hangi günde olduğumuzu çağır

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _currentTime = _currentTime.addSeconds(1);
      _reverseTime = _reverseTime.subtractSeconds(1);
      day = _zonedDateTime.dayOfWeek.value - 1;

      _controller.updateTime(
          // Modeli güncelle
          localTime: _currentTime,
          reverseTime: _reverseTime,
          day: day);
    });
    print(Timeline.now.milliseconds);
  }

  /// Returns Server Time
  Future<ZonedDateTime> _fetchServerTime() async {
    try {
      var tzdb = await DateTimeZoneProviders.tzdb;
      var noronha = await tzdb['America/Noronha'];
      var now = Instant.now();

      return now.inZone(noronha);
    } catch (e) {
      print('HATA :> ' + e);
      return null;
    }
  }
}

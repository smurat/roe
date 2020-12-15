import 'package:flutter/material.dart';
import 'package:son_roe/events/utility/model_events.dart';
import 'package:son_roe/events/page1/controllertime.dart';
import 'package:son_roe/parts/t9calculator/utility/services_t9.dart';
import 'package:time_machine/time_machine.dart';

TextStyle _hourStyle = TextStyle(color: Colors.white, fontSize: 20);

class TopSide extends StatelessWidget {
  const TopSide({
    Key key,
    @required ModelEvents model,
  })  : _model = model,
        super(key: key);
  final ModelEvents _model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.19,
      child: Column(
        children: [
          Row(
            children: [TopLeftWidget(), TopRightWidget(model: _model)],
          ),
          Row(
            children: [BottomLeftWidget(), BottomRightWidget(model: _model)],
          ),
        ],
      ),
    );
  }
}

class TopRightWidget extends StatelessWidget {
  const TopRightWidget({
    Key key,
    @required ModelEvents model,
  })  : _model = model,
        super(key: key);

  final ModelEvents _model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 10, 8, 0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.61,
        height: MediaQuery.of(context).size.height * 0.08,
        color: Colors.grey.shade800,
        child: Obx(() {
          var hr = Get.find<ControllerServerTime>().model.value.hr;
          var day = Get.find<ControllerServerTime>().model.value.day;

          return Text('${_model.weekday[day].daycontents[hr].eventtitle}');
          //   return Text('${_model.weekday[1].daycontents[1].eventtitle}');
        }),
      ),
    );
  }
}

class BottomRightWidget extends StatelessWidget {
  const BottomRightWidget({
    Key key,
    @required ModelEvents model,
  })  : _model = model,
        super(key: key);

  final ModelEvents _model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 10, 8, 0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.61,
        height: MediaQuery.of(context).size.height * 0.08,
        color: Colors.grey.shade800,
        child: Obx(() {
          var nextEventHr =
              Get.find<ControllerServerTime>().model.value.nextEventHr; 
          var day = Get.find<ControllerServerTime>().model.value.day; 
          return Text(
              '${_model.weekday[_dateLine(nextEventHr - 1, day)].daycontents[_hourLine(nextEventHr)].eventtitle}');
        }),
      ),
    );
  }

  int _hourLine(int hour) => hour == 24 ? 0 : hour;
  int _dateLine(int hour, int day) =>
      hour == 23 ? (day == 6 ? 0 : day + 1) : day;
}

class TopLeftWidget extends StatelessWidget {
  const TopLeftWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 10, 0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.31,
        height: MediaQuery.of(context).size.height * 0.08,
        color: Colors.grey.shade800,
        child: Obx(() => Center(
                child: Text(
              '${Get.find<ControllerServerTime>().model.value.serverTime}',
              style: _hourStyle,
            ))),
      ),
    );
  }
}

class BottomLeftWidget extends StatelessWidget {
  const BottomLeftWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 10, 0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.31,
        height: MediaQuery.of(context).size.height * 0.08,
        color: Colors.grey.shade800,
        child: Obx(() {
          // var reverseTime = reverse;
          return Center(
            child: Text(_time(), style: _hourStyle),
          );
        }),
      ),
    );
  }

  String _time() {
    try {
      var reverseT = Get.find<ControllerServerTime>().model.value.reverse;
      String mm = reverseT.minuteOfHour.toString();
      String ss = reverseT.secondOfMinute.toString();
      ss = reverseT.secondOfMinute < 10 ? ss = '0$ss' : ss;
      return '$mm:$ss';
    } catch (e) {
      return '';
    }
  }
}

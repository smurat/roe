import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:son_roe/events/utility/services_event.dart';
import 'package:son_roe/locator.dart';
import 'package:son_roe/parts/gathering/constants_gathering.dart';
import 'package:son_roe/parts/gathering/gathering_page.dart';

class SettingsPageOfGathering extends StatefulWidget {
  @override
  _SettingsPageOfGatheringState createState() =>
      _SettingsPageOfGatheringState();
}

// Girilen Tüm değerler box.read('gatheringStepperValues') ile alınabilir.
class _SettingsPageOfGatheringState extends State<SettingsPageOfGathering> {
  int _activeStep = 0;
  List<Map<String, double>> listOfConstants = [
    ConstantOfGathering.expeditionForceMap, //0
    ConstantOfGathering.armExpertIMap, //1
    ConstantOfGathering.incentiveGatheringMap, //2
    ConstantOfGathering.armExpertIIMap, //3
  ];
  List<String> stepperTitles = [
    'Expedition Force',
    'Arm Expert - I',
    'Incentive Gathering',
    'Arm Expert - II',
  ];
  List<String> stepperSubtitle = [
    'Expedition Force Araştırması\'nı Giriniz',
    'Arm Expert I Araştırması\'nı Giriniz',
    'Incentive Gathering Araştırması\'nı Giriniz',
    'Arm Expert - II Araştırması\'nı Giriniz',
  ];
  List<double> values = [
    0,
    0,
    0,
    0,
  ];
  GetStorage box;
  bool isSettingsDone;

  @override
  void initState() {
    super.initState();
    box = getIt<GetStorage>();

    if (box.read('gatheringStepperTitles') != null) {
      stepperTitles = List<String>.from(box.read('gatheringStepperTitles'));
    }
    if (box.read('gatheringStepperValues') != null) {
      values = List<double>.from(box.read('gatheringStepperValues'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.grey.shade900,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 6,
            child: Column(
              children: [
                Stepper(
                    currentStep: _activeStep,
                    onStepTapped: (index) {
                      setState(() {
                        _activeStep = index;
                      });
                    },
                    onStepContinue: () {
                      int val = _activeStep; //_activeStep=index

                      if (_activeStep < listOfConstants.length - 1) {
                        setState(() {
                          _activeStep++;
                        });
                      }
                      if (val == 3) {
                        //SON ADIM
                        box.write('gatheringStepperValues', values);

                        getIt<GetStorage>().read('isSettingsDone') == null
                            ? Get.to(MainGatheringPage())
                            : Navigator.of(context).pop();
                        box
                            .write('isSettingsDone', true)
                            .then((value) => print('SAVED'));
                      }
                    },
                    onStepCancel: () {
                      if (_activeStep > 0) {
                        setState(() {
                          _activeStep--;
                        });
                      }
                    },
                    steps: List.generate(4, (index) => buildStep(index)))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Step buildStep(int index) {
    return Step(
        state: StepState.indexed,
        isActive: true,
        title: Text('${stepperTitles[index]}'),
        subtitle: Text('${stepperSubtitle[index]}'),
        content: Align(
            alignment: Alignment.centerLeft,
            child: buildDropdownButton(index: index)));
  }

  DropdownButton buildDropdownButton({@required int index}) {
    return DropdownButton(
        hint: Text(stepperTitles[index]),
        items: buildDropdownMenuItem(index),
        onChanged: (value) {
          values[index] = value;
          setState(() {
            stepperTitles[index] =
                listOfConstants[index].keys.firstWhere((element) {
              return listOfConstants[index][element] == value;
            }, orElse: () => null);
            box.write('gatheringStepperTitles', stepperTitles);
            box.write('gatheringStepperValues', values);
          });
        });
  }

  List<DropdownMenuItem> buildDropdownMenuItem(int index) {
    List<DropdownMenuItem> liste = List();
    listOfConstants[index].forEach((key, value) {
      liste.add(DropdownMenuItem(
        child: Text(key),
        value: value,
      ));
    });
    return liste;
  }
}

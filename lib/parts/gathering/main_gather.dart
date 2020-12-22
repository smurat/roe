import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:son_roe/events/utility/services_event.dart';
import 'constants_gathering.dart';

class GatheringMainPage extends StatefulWidget {
  @override
  _GatheringMainPageState createState() => _GatheringMainPageState();
}

class _GatheringMainPageState extends State<GatheringMainPage> {
  List<String> hint = [
    'ExpeditionForce',
    'ArmExpert-I',
    'incentiveGathering',
    'ArmExpert-II',
    'No Boost',
    'Rss',
  ];
  List<double> values = [0, 0, 0, 0, 0, 0];
  List<Map<String, double>> listOfConstants = [
    ConstantOfGathering.expeditionForceMap, //0
    ConstantOfGathering.armExpertIMap, //1
    ConstantOfGathering.incentiveGatheringMap, //2
    ConstantOfGathering.armExpertIIMap, //3
    ConstantOfGathering.boostMap, //4
    ConstantOfGathering.typeFactorMap, //5
  ];
  List<String> stepperTitles = [
    'Expedition Force',
    'Arm Expert - I',
    'Incentive Gathering',
    'Arm Expert - II',
    'Boost',
    'Resource'
  ];
  List<String> stepperSubtitle = [
    'Expedition Force Araştırması\'nı Giriniz',
    'Arm Expert I Araştırması\'nı Giriniz',
    'Incentive Gathering Araştırması\'nı Giriniz',
    'Arm Expert - II Araştırması\'nı Giriniz',
    'Boost Türünü Giriniz',
    'Resource Türünü Giriniz',
  ];
  int _activeStep = 0;

  int resources = 15000;
  double result = 1;
  GetStorage box;

  @override
  void initState() {
    super.initState();
    box = getIt<GetStorage>();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ExpansionTileCard(
                    duration: Duration(milliseconds: 600),
                    leading: Icon(Icons.add_circle),
                    subtitle: Text('Subtitle'),
                    initiallyExpanded: true,
                    animateTrailing: true,
                    //isThreeLine: true,
                    initialElevation: 2,
                    title: Text('title'),
                    onExpansionChanged: (value) {
                      print(values);
                    },
                    children: [
                      Divider(
                        thickness: 1.0,
                        height: 1.0,
                      ),
                      Stepper(
                          currentStep: _activeStep,
                          onStepTapped: (index) {
                            setState(() {
                              _activeStep = index;
                            });
                          },
                          onStepContinue: () {
                            int val = _activeStep;
                            if (_activeStep < listOfConstants.length - 1) {
                              setState(() {
                                _activeStep++;
                              });
                            }
                            if (val == 5) {
                              print('İşlemleri Gerçekleştir');
                              //TODO GATHERING Son STEP
                            }
                          },
                          onStepCancel: () {
                            if (_activeStep > 0) {
                              setState(() {
                                _activeStep--;
                              });
                            }
                          },
                          steps: List.generate(6, (index) => buildStep(index))),
                    ],
                  ),
                ),
                SizedBox(
                  height: 500,
                )
              ],
            ),
          )),
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
        hint: Text(hint[index]),
        items: buildDropdownMenuItem(index),
        onChanged: (value) {
          values[index] = value;
          setState(() {
            hint[index] = listOfConstants[index].keys.firstWhere((element) {
              return listOfConstants[index][element] == value;
            }, orElse: () => null);
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

/**
 * 
 * 
 *  Stepper(
              currentStep: _activeStep,
              onStepTapped: (index) {
                setState(() {
                  _activeStep = index;
                });
              },
              onStepContinue: () {
                int val = _activeStep;
                if (_activeStep < listOfConstants.length - 1) {
                  setState(() {
                    _activeStep++;
                  });
                }
                if (val == 5) {
                  print('İşlemleri Gerçekleştir');
                  //TODO GATHERING Son STEP
                }
              },
              onStepCancel: () {
                if (_activeStep > 0) {
                  setState(() {
                    _activeStep--;
                  });
                }
              },
              steps: List.generate(6, (index) => buildStep(index))),
 */

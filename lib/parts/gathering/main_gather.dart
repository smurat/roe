import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:son_roe/events/utility/services_event.dart';

import 'constants_gathering.dart';

class GatheringMainPage extends StatefulWidget {
  @override
  _GatheringMainPageState createState() => _GatheringMainPageState();
}

class _GatheringMainPageState extends State<GatheringMainPage> {
  final GlobalKey<ExpansionTileCardState> expansionTile = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> expansionTile2 = new GlobalKey();
  List<Map<String, double>> listOfConstants = [
    ConstantOfGathering.expeditionForceMap, //0
    ConstantOfGathering.armExpertIMap, //1
    ConstantOfGathering.incentiveGatheringMap, //2
    ConstantOfGathering.armExpertIIMap, //3
    ConstantOfGathering.boostMap, //4
    ConstantOfGathering.typeFactorMap, //5
  ];
  List<double> values = [0, 0, 0, 0, 0, 0];
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

  
  
  GetStorage box;
  bool isInitiallyExpanded = true;

  final _controllerToplam = TextEditingController();

  final List<TextEditingController> _controllers =
      List.generate(5, (index) => TextEditingController()).toList();
  List<bool> _checkBoxValues = [
    false,
    false,
    false,
    false,
    false,
  ];
  List<String> _legionsTextValue = [
    '0',
    '0',
    '0',
    '0',
    '0',
  ]; //Legion I-II-III-IV-V
  List<String> _legionsTitles = [
    'Legion I',
    'Legion II',
    'Legion III',
    'Legion IV',
    'Legion V'
  ];

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
    isInitiallyExpanded = box.read('InitiallyExpanded') ?? isInitiallyExpanded;
    
    _controllers.forEach((element) {
      element.text = '0';
    });
    _controllerToplam.clear();
  }

  @override
  void dispose() {
    _controllerToplam.dispose();
    _controllers.forEach((element) {
      element.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.grey.shade200,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ExpansionTileCard(
                    key: expansionTile,
                    duration: Duration(milliseconds: 600),
                    leading: Icon(Icons.add_circle),
                    subtitle: Text('Subtitle'),
                    initiallyExpanded: isInitiallyExpanded,
                    animateTrailing: true,
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
                            int val = _activeStep; //_activeStep=index

                            if (_activeStep < listOfConstants.length - 1) {
                              setState(() {
                                _activeStep++;
                              });
                            }
                            if (val == 5) {
                              isInitiallyExpanded = false;
                              box.write(
                                  'InitiallyExpanded', isInitiallyExpanded);
                              expansionTile.currentState.collapse();
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ExpansionTileCard(
                    initialElevation: 2,
                    initiallyExpanded: true,
                    key: expansionTile2,
                    title: Text('Legions'),
                    children: [
                      Divider(),
                      Form(
                        child: Container(
                          height: 460,
                          child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return buildContainer(context, index);
                            },
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.done),
                        onPressed: () {
                          expansionTile2.currentState.collapse();
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                    width: 200,
                    child: TextFormField(
                        onChanged: (value) {},
                        controller: _controllerToplam,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Toplam',
                            suffixIcon: IconButton(
                                icon: Icon(Icons.cancel),
                                onPressed: () {
                                  setState(() {
                                    _controllerToplam.clear();
                                  });
                                }),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))))),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      print('AA' + _controllers[0].text);
//TODO hesaplama yap
                    },
                    child: Text(
                      'Hesapla',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(8, 8),
                              color: Colors.grey.withOpacity(0.3))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Column(
                      children: [
                        Text('Legion I    -  ${_controllers[0].text}'),
                        Text('Legion II   -  ${_controllers[1].text}'),
                        Text('Legion III  -  ${_controllers[2].text}'),
                        Text('Legion IV  -  ${_controllers[3].text}'),
                        Text('Legion V   -  ${_controllers[4].text}'),
                        Text('Toplam   -  ${_controllerToplam.text}'),
                      ],
                    )),
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

  _topla() {
    var x1 = int.parse(_controllers[0].text);
    var x2 = int.parse(_controllers[1].text);
    var x3 = int.parse(_controllers[2].text);
    var x4 = int.parse(_controllers[3].text);
    var x5 = int.parse(_controllers[4].text);

    var sum = x1 + x2 + x3 + x4 + x5;
    print('SUM : $sum');
    setState(() {
      _controllerToplam.text = sum.toString();
    });
  }

  Container buildContainer(BuildContext context, int index) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Checkbox(
            value: _checkBoxValues[index],
            onChanged: (value) {
              setState(() {
                _checkBoxValues[index] = !_checkBoxValues[index];
                //TODO CheckBox Seçimlerini hatırlamak için bool değerini sakla
              });
            },
          ),
          Text(_legionsTitles[index]),
          buildTextInputFormField(
              controller: _controllers[index],
              textValue: _legionsTextValue[index],
              checkBoxIndex: index)
        ],
      ),
    );
  }

  Container buildTextInputFormField(
      {@required TextEditingController controller,
      @required String textValue,
      @required int checkBoxIndex}) {
    return Container(
        padding: EdgeInsets.all(8),
        width: 160,
        child: TextFormField(
          enabled: _checkBoxValues[checkBoxIndex],
          controller: controller,
          onEditingComplete: () {
            controller.text = controller.text ?? '0';
            FocusScope.of(context).unfocus();
            setState(() {});
          },
          onTap: () {},
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      controller.clear();
                      textValue = '0';
                    });
                  }),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
          maxLength: 7,
          onChanged: (value) {
            setState(() {
              textValue = value;
              _topla();
            });
          },
        ));
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
//TODO -> TEK TİP için toplamayı YAP
//TODO ->Legionların yanına farklı tiplerden RSS türü tekleyerek toplamayı yap
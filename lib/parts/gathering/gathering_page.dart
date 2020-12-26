import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:son_roe/events/utility/services_event.dart';
import 'package:son_roe/parts/gathering/constants_gathering.dart';
import 'package:son_roe/parts/gathering/gather_settings_page.dart';

class MainGatheringPage extends StatefulWidget {
  @override
  _MainGatheringPageState createState() => _MainGatheringPageState();
}

class _MainGatheringPageState extends State<MainGatheringPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Map<String, double>> listOfConstants = [
    ConstantOfGathering.boostMap, //0
    ConstantOfGathering.typeFactorMap, //1
  ];

  String _boostTitle = 'Boost';
  double _boostValue = 0;

  List<TextEditingController> controllersList = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  List<String> _rssTitleList = [
    'Resource',
    'Resource',
    'Resource',
    'Resource',
    'Resource',
  ];
  List<double> _rssValueList = [0, 0, 0, 0, 0];
  List<bool> checkBoxList = [
    true,
    true,
    true,
    true,
    false,
  ];
  List<String> textValueList = ['0', '0', '0', '0', '0'];
  List<double> resultList = [0, 0, 0, 0, 0];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // getIt<GetStorage>().read('gatheringStepperValues');
    print('INIT');
    controllersList.forEach((element) {
      element.text = '0';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Get.to(SettingsPageOfGathering());
              })
        ],
        title: Text('Gathering Calculator'),
        backgroundColor: Colors.grey.shade900,
        bottom: TabBar(controller: _tabController, tabs: [
          Tab(child: Text('Gather - I')),
          Tab(child: Text('Gather - II'))
        ]),
      ),
      body: TabBarView(controller: _tabController, children: [
          Center(
      child: Column(
            children: [
      DropdownButton(
        hint: Text(_boostTitle),
        items: buildDropdownMenuItem(0),
        onChanged: (value) {
          _boostValue = value;
          print(_boostValue);
          setState(() {
            _boostTitle = listOfConstants[0].keys.firstWhere((element) {
              return listOfConstants[0][element] == value;
            }, orElse: () => null);
          });
        },
      ),
      Text('1'),
      Container(
        height: 300,
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return buildLegions(context, index);
          },
        ),
      ),
      Center(
          child: RaisedButton(
              child: Text('Hesapla'),
              onPressed: () {
                double base = 1;

                List settingsValue =
                    getIt<GetStorage>().read('gatheringStepperValues');

                List<double> girilen = textValueList.map((e) {
                  return double.parse(e);
                }).toList();

                //RSS MIKTARI * RSS TIPI * (BASE + BOOST + ARASTIRMA)
                for (var i = 0; i < 5; i++) {
                  resultList[i] = girilen[i] *
                      _rssValueList[i] *
                      (base +
                          _boostValue +
                          settingsValue[0] +
                          settingsValue[1] +
                          settingsValue[2] +
                          settingsValue[3]);
                }
                _calculateTotal();
              })),
//RESULT EKRANI
      Container(
        padding: EdgeInsets.all(12),
        height: 130,
        width: MediaQuery.of(context).size.width * 0.6,
        color: Colors.black.withOpacity(0.3),
        child: Column(
          children: [
            Column(
              children:
                  List.generate(5, (index) => buildResultScreen(index)),
            ),
            Text('TOPLAM : ${_calculateTotal()}')
          ],
        ),
      ),
            ],
          )),
          //IKINCI SAYFA
          Center(child: RaisedButton(child: Text('ss'), onPressed: () {}))
        ]),
    );
  }

  String _calculateTotal() {
    double toplam = 0;
    resultList.forEach((element) {
      toplam += element;
    });
   
    return toplam.toString();
    print(toplam);
  }

  Row buildResultScreen(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Legion ${index + 1} ',
          style: TextStyle(color: Colors.white),
        ),
        Text(
          '${resultList[index]??0}',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Container buildLegions(BuildContext context, int index) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Checkbox(
            value: checkBoxList[index],
            onChanged: (value) {
              setState(() {
                checkBoxList[index] = value;
                if (checkBoxList[index] == false) {
                  controllersList[index].text = 0.toString();
                }
              });
            },
          ),
          Text('Legion ${index + 1}'),
          DropdownButton(
            hint: Text(_rssTitleList[index]),
            items: buildDropdownMenuItem(1),
            onChanged: (value) {
              setState(() {
                _rssValueList[index] = value;
                _rssTitleList[index] =
                    listOfConstants[1].keys.firstWhere((element) {
                  return listOfConstants[1][element] == value;
                }, orElse: () => null);
              });
            },
          ),
          Container(
            height: 60,
            width: 140,
            padding: EdgeInsets.all(8),
            child: TextFormField(
              style: TextStyle(fontSize: 14),
              enabled: checkBoxList[index],
              controller: controllersList[index],
              onEditingComplete: () {
                FocusScope.of(context).unfocus();
                print(controllersList[index].text);
              },
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  suffixIcon: IconButton(
                      icon: Icon(
                        Icons.cancel,
                        size: 16,
                      ),
                      onPressed: () {
                        setState(() {
                          controllersList[index].clear();
                          textValueList[index] = '0';
                        });
                      }),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  textValueList[index] = value;
                });
              },
            ),
          )
        ],
      ),
    );
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

/***
 * 
 * 
 * 
 * result = girilen[0] *
                          _rssValueList[0] *
                          (base +
                              _boostValue +
                              settingsValue[0] +
                              settingsValue[1] +
                              settingsValue[2] +
                              settingsValue[3]);
 */

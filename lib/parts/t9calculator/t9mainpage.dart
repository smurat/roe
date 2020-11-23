import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 't9controller.dart';
import 'widgets/ResearcherContainer.dart';

class T9CalculatorPage extends StatelessWidget {
  final _cav = [
    'Cavalry Recruitment',
    'Squirehood',
    'Warpath',
    'Plain Skirmish',
    'Ebony Barding',
    'Empire Defender'
  ];

  final T9Controlcu _controller = Get.put(T9Controlcu());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(                  
                  stretch: true,
                  expandedHeight: 200,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: false,

                    stretchModes: [
                      StretchMode.zoomBackground,
                      StretchMode.blurBackground,
                      StretchMode.fadeTitle
                    ],
                    title: Text('T9 Researchers'),
                    background: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      AssetImage('assets/images/cavalry.jpg'))),
                        ),
                        Positioned(
                          right: 0,
                          child: Container(
                            width: 100,
                            height: 200,
                            color: Colors.black87.withOpacity(0.4),
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Obx(() => CircularPercentIndicator(
                                      animateFromLastPercent: true,
                                      progressColor: Colors.blue.shade400,
                                      backgroundColor: Colors.white,
                                      radius: 70,
                                      lineWidth: 4,
                                      percent: _controller.percentage.value,
                                      center: Text(
                                        '${(_controller.percentage * 100).toStringAsFixed(0)} %', //TODO KALAN MEDAL %
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      animation: true,
                                    )),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Center(
                                child: Container(
                                  height: 25,
                                  color: Colors.black87.withOpacity(0.45),
                                  width: 100,
                                  child: Center(
                                    child: Text(
                                      'Left Cougrage',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 25,
                                color: Colors.black87.withOpacity(0.45),
                                width: 100,
                                child: Center(
                                  child: Obx(() => Text(
                                        '${_controller.totalMedalLeftT9}', //TODO kalanMEDAL
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ), //IMAGE gelecek
                  ),
                )
              ];
            },
            body: t9Body(_cav)),
      ),
    );
  }

  ListView t9Body(List list) => ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ResearcherContainer(
                      //Cavalry Recruitment
                      researchTitle: list[0],
                      increase: () {
                        _controller.arttir(0);
                      },
                      decrease: () {
                        _controller.azalt(0);
                      },
                      researchID: 0,
                      controller: _controller,
                    ),
                    ResearcherContainer(
                      researchTitle: list[1],
                      controller: _controller,
                      increase: () {
                        _controller.arttir(1);
                      },
                      decrease: () {
                        _controller.azalt(1);
                      },
                      researchID: 1,
                    ),
                  ],
                ),
              ),
              ResearcherContainer(
                //WARPATH
                researchTitle: list[2],
                controller: _controller,
                increase: () {
                  _controller.arttir(2);
                },
                decrease: () {
                  _controller.azalt(2);
                },
                researchID: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ResearcherContainer(
                      researchTitle: list[3],
                      increase: () {
                        _controller.arttir(3);
                      },
                      decrease: () {
                        _controller.azalt(3);
                      },
                      researchID: 3,
                      controller: _controller,
                    ),
                    ResearcherContainer(
                      researchTitle: list[4],
                      increase: () {
                        _controller.arttir(4);
                      },
                      decrease: () {
                        _controller.azalt(4);
                      },
                      researchID: 4,
                      controller: _controller,
                    ),
                  ],
                ),
              ),
              ResearcherContainer(
                researchTitle: list[5],
                increase: () {
                  _controller.arttir(5);
                },
                decrease: () {
                  _controller.azalt(5);
                },
                researchID: 5,
                controller: _controller,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      _saveLevels();
                      Get.snackbar('Save', 'Save Complete ✔');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.save_alt),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Save'), //TODO T9 Save Butonu
                        )
                      ],
                    )),
              ),
              RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    _resetLevels();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.settings_backup_restore),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Reset'), //TODO T9 Reset Butonu
                      )
                    ],
                  )),
            ],
          ),
          SizedBox(
            height: 50,
          )
        ],
      );

  _saveLevels() {
    var controller = Get.find<T9Controlcu>();
    GetStorage box = GetStorage();
    box.write('t1a', controller.cavalryRecruimentLv.value);
    box.write('t1b', controller.squirehoodLv.value);
    box.write('t2', controller.warPathLv.value);
    box.write('t3a', controller.plainSkirmishLv.value);
    box.write('t3b', controller.ebonyBardingLv.value);
    box.write('t4', controller.empireDefenderLv.value);
    box.write('t9', controller.totalMedalLeftT9.value);
    box.write('total', controller.totalMedalLeft.value);
  }

  _resetLevels() {
    Get.defaultDialog(
        title: 'Reset',
        content: Text('Are you sure ?'),
        actions: [
          FlatButton(
              onPressed: () {
                Get.back();
              },
              child: Text('No')),
          RaisedButton(
            onPressed: () {
              Get.back();
              _controller.cavalryRecruimentLv.value = 0;
              _controller.squirehoodLv.value = 0;
              _controller.warPathLv.value = 0;
              _controller.plainSkirmishLv.value = 0;
              _controller.ebonyBardingLv.value = 0;
              _controller.empireDefenderLv.value = 0;

              _controller.medalCavalryRecruiment1.value = 8760;
              _controller.medalSquirehood2.value = 8760;
              _controller.medalWarPath3.value = 11670;
              _controller.medalPlainSkirmish4.value = 46700;
              _controller.medalEbonyBarding5.value = 46700;
              _controller.medalEmpireDefender6.value = 17500;

              _controller.totalMedalLeft.value = 140090;
              _controller.totalMedalLeftT9.value = 131380;
            },
            child: Text('Yes'),
          ),
        ]);
  }
}

/**
 * 
 * CircularPercentIndicator(
                      radius: 46,
                      animateFromLastPercent: true,
                      progressColor: Colors.blue.shade400,
                      backgroundColor: Colors.white,
                      lineWidth: 3,
                      percent: _controller.percentage.value,
                      center: Text(
                        '${(_controller.percentage * 100).toStringAsFixed(0)} %', 
                        style: TextStyle(color: Colors.white),
                      ),
                      animation: true,
                    ),
 * 
 */

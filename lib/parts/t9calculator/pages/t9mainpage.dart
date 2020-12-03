import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:son_roe/parts/t9calculator/widgets/ResearcherContainer.dart';

class T9MainPage extends StatelessWidget {
  T9MainPage({Key key, @required this.controller, @required this.type,@required this.mainImage})
      : super(key: key);
  final _cav = [
    'Cavalry Recruitment',
    'Squirehood',
    'Warpath',
    'Plain Skirmish',
    'Ebony Barding',
    'Empire Defender'
  ];
  final controller;
  final type;
  final mainImage;

  @override
  Widget build(BuildContext context) {           
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
               var imageHeight = MediaQuery.of(context).size.height*0.256;
              return <Widget>[
                SliverAppBar(
                  stretch: true,
                  expandedHeight: imageHeight,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: false,

                    stretchModes: [
                      StretchMode.zoomBackground,
                      StretchMode.blurBackground,
                      StretchMode.fadeTitle
                    ],
                    title: Text(type),
                    background: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      AssetImage(mainImage))),
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
                                      percent:
                                          controller.model.value.percentage,
                                      center: Text(
                                        '${(controller.model.value.percentage * 100).toStringAsFixed(0)} %', //TODO KALAN MEDAL %
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
                                        '${controller.model.value.t9Left}', //TODO kalanMEDAL
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
//TODO ARTTIRMA BUTONO
                    ResearcherContainer(
                      //Cavalry Recruitment
                      researchTitle: list[0],
                      increase: () {
                        controller.arttir(0);
                      },
                      decrease: () {
                        controller.azalt(0);
                      },
                      researchID: 0,
                      controller: controller,
                    ),
                    ResearcherContainer(
                      researchTitle: list[1],
                      controller: controller,
                      increase: () {
                        controller.arttir(1);
                      },
                      decrease: () {
                        controller.azalt(1);
                      },
                      researchID: 1,
                    ),
                  ],
                ),
              ),
              ResearcherContainer(
                //WARPATH
                researchTitle: list[2],
                controller: controller,
                increase: () {
                  controller.arttir(2);
                },
                decrease: () {
                  controller.azalt(2);
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
                        controller.arttir(3);
                      },
                      decrease: () {
                        controller.azalt(3);
                      },
                      researchID: 3,
                      controller: controller,
                    ),
                    ResearcherContainer(
                      researchTitle: list[4],
                      increase: () {
                        controller.arttir(4);
                      },
                      decrease: () {
                        controller.azalt(4);
                      },
                      researchID: 4,
                      controller: controller,
                    ),
                  ],
                ),
              ),
              ResearcherContainer(
                researchTitle: list[5],
                increase: () {
                  controller.arttir(5);
                },
                decrease: () {
                  controller.azalt(5);
                },
                researchID: 5,
                controller: controller,
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
                      //TODO T9 Save Butonu
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
                          child: Text('Save'),
                        )
                      ],
                    )),
              ),
              RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    //TODO T9 Reset Butonu
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
                        child: Text('Reset'),
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
    GetStorage box = GetStorage();   

    switch (controller.model.value.type) {
      case 'Footman':
        print('Footman');
         box.write('Footman', _writeValueToLocal());
        break;
      case 'Archer':
        print(_writeValueToLocal());
          box.write('Archer', _writeValueToLocal());
        break;
      case 'Cavalry':
        print(_writeValueToLocal());
          box.write('Cavalry', _writeValueToLocal());

        break;
      default:
    }

  }

  List<dynamic> _writeValueToLocal() {
    return [
      controller.model.value.levels,
      controller.model.value.medals,
      controller.model.value.t9Left,
      controller.model.value.totalLeft,
      controller.model.value.percentage
    ];
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
              switch (controller.model.value.type) {
                case 'Archer':
                  controller.reset();
                  break;
                case 'Footman':
                  controller.reset();
                  break;
                case 'Cavalry':
                  controller.reset();
                  break;
                default:
              }
              Get.back();
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

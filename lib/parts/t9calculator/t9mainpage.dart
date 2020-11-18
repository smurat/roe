import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
                  expandedHeight: 200,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text('T9 Researchers'),
                    background: Container(color: Colors.amber), //IMAGE gelecek
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
                    print(Get.find<T9Controlcu>().cavalryRecruimentLv);
                    GetStorage box = GetStorage();
                    print(box.read('t1a'));
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
    print('saved');
    var controller = Get.find<T9Controlcu>();
    GetStorage box = GetStorage();
    box.write('t1a', controller.cavalryRecruimentLv);
    box.write('t1b', controller.squirehoodLv);
    box.write('t2', controller.warPathLv);
    box.write('t3a', controller.plainSkirmishLv);
    box.write('t3b', controller.ebonyBardingLv);
    box.write('t4', controller.empireDefenderLv);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                      researchID: 0,
                      controller: _controller,
                    ),
                    ResearcherContainer(
                      researchTitle: list[1],
                      controller: _controller,
                      increase: () {
                        _controller.arttir(1);
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
                      researchID: 3,
                      controller: _controller,
                    ),
                    ResearcherContainer(
                      researchTitle: list[4],
                      increase: () {
                        _controller.arttir(4);
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
                researchID: 5,
                controller: _controller,
              ),
            ],
          )
        ],
      );
}

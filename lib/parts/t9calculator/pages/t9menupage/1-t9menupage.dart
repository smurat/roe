import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:son_roe/parts/t9calculator/controller/t9controllerarch.dart';
import 'package:son_roe/parts/t9calculator/controller/t9controllercav.dart';
import 'package:son_roe/parts/t9calculator/controller/t9controllerfoot.dart';
import 'package:son_roe/parts/t9calculator/t9model.dart';

import '../t9researchpage/2-t9researchpage.dart';

class T9ManuPage extends StatelessWidget {
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              var imageHeight = MediaQuery.of(context).size.height * 0.256;

              return [
                SliverAppBar(
                  expandedHeight: imageHeight,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    background: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/dragon.jpg'))),
                    ),
                  ),
                )
              ];
            },
            body: Container(
              color: Colors.black87.withOpacity(0.9),
              child: ListView(
                children: [
                  InkWell(
                    child: T9MenuPageItemWidget(
                      image: 'assets/images/f1.png',
                      controller: Get.find<T9ControllerFootman>(),
                      title: 'FOOTMAN',
                    ),
                    onTap: () async {
                      var list = await box.read('Footman');

                      /*   if (list != null) {
                        _updateValues(
                            Get.find<T9ControllerFootman>().model.value, list);
                      }*/

                      Get.to(T9ResearchPage(
                        type: 'FOOTMAN T9',
                        controller: Get.find<T9ControllerFootman>(),
                        mainImage: 'assets/images/footman.jpg',
                      ));
                    },
                  ),
                  InkWell(
                      child: T9MenuPageItemWidget(
                        image: 'assets/images/a11.png',
                        controller: Get.find<T9ControllerArcher>(),
                        title: 'ARCHER',
                      ),
                      onTap: () async {
                        var list = await box.read('Archer');

                        /*   if (list != null) {
                          _updateValues(
                              Get.find<T9ControllerArcher>().model.value, list);
                        }*/

                        Get.to(T9ResearchPage(
                          type: 'ARCHER T9',
                          controller: Get.find<T9ControllerArcher>(),
                          mainImage: 'assets/images/archer.jpg',
                        ));
                      }),
                  InkWell(
                    child: T9MenuPageItemWidget(
                      image: 'assets/images/c1.png',
                      controller: Get.find<T9ControllerCavalry>(),
                      title: 'CAVALRY',
                    ),
                    onTap: () async {
                      var list = await box.read('Cavalry');

                      /*   if (list != null) {
                        _updateValues(
                            Get.find<T9ControllerCavalry>().model.value, list);
                      }*/

                      Get.to(T9ResearchPage(
                        type: 'CAVALRY T9',
                        controller: Get.find<T9ControllerCavalry>(),
                        mainImage: 'assets/images/cavalry.jpg',
                      ));
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }

  _updateValues(T9Model model, List list) {
    List<int> list1 = List.from(list[0]);
    List<int> list2 = List.from(list[1]);
    model.levels = list1;
    model.medals = list2;
    model.t9Left = list[2];
    model.totalLeft = list[3];
    model.percentage = list[4];
  }
}

class T9MenuPageItemWidget extends StatelessWidget {
  //TODO T9 TYPE PAGE MENU ITEM WIDGET
  const T9MenuPageItemWidget({
    Key key,
    @required this.image,
    this.title,
    this.controller,
  }) : super(key: key);

  final String image;
  final String title;
  final controller;

  @override
  Widget build(BuildContext context) {
    var itemHeight = MediaQuery.of(context).size.height * 0.154;
    var padding = MediaQuery.of(context).size.width * 0.05;
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Container(
        height: itemHeight,
        decoration: BoxDecoration(
            border: Border.all(width: 0.2),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.15),
                spreadRadius: 2,
                offset: Offset(6, 6),
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Container(
              child: Image.asset(
                image,
              ),
              width: MediaQuery.of(context).size.width * 0.30,
            ),
            VerticalDivider(
              thickness: 1,
              endIndent: 12,
              indent: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(() => LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width * 0.40,
                              lineHeight: 12,
                              curve: Curves.linear,
                              percent: controller.model.value.percentage,
                              progressColor: Colors.blue,
                              center: Text(
                                (controller.model.value.percentage * 100)
                                        .toStringAsFixed(0) +
                                    ' %',
                                style: TextStyle(fontSize: 10),
                              ),
                            )),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Left Medal : ',
                          style: TextStyle(fontSize: 12),
                        ),
                        Obx(() => Text(
                              '${controller.model.value.t9Left}',
                              style: TextStyle(fontSize: 12),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
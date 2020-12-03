import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:son_roe/TEST/test.dart';
import 'package:son_roe/parts/t9calculator/controller/t9controllerarch.dart';

import 'package:son_roe/parts/t9calculator/controller/t9controllercav.dart';
import 'package:son_roe/parts/t9calculator/controller/t9controllerfoot.dart';

import 'parts/menu/menuPage.dart';

void main() async {
  await GetStorage.init();
  initController();
  runApp(MyApp());
}

void initController() {
  Get.put(T9ControllerCavalry());
  Get.put(T9ControllerArcher());
  Get.put(T9ControllerFootman());
  initValues();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: TestDosyasi(),
      home: MenuPage(),
      // home: TESTT9MenuPage(),
    );
  }
}

initValues() {
  GetStorage box = GetStorage();

  if (box.read('Cavalry') != null) {
    Get.find<T9ControllerCavalry>().model.value.percentage =
        box.read('Cavalry')[4];
    Get.find<T9ControllerCavalry>().model.value.t9Left = box.read('Cavalry')[2];
  }
  if (box.read('Archer') != null) {
    Get.find<T9ControllerArcher>().model.value.percentage =
        box.read('Archer')[4];
    Get.find<T9ControllerArcher>().model.value.t9Left = box.read('Archer')[2];
  }
  if (box.read('Footman') != null) {
    Get.find<T9ControllerFootman>().model.value.percentage =
        box.read('Footman')[4];
    Get.find<T9ControllerFootman>().model.value.t9Left = box.read('Footman')[2];
    
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:son_roe/TEST/test.dart';

import 'parts/menu/menuPage.dart';
import 'parts/t9calculator/t9controller.dart';

void main() async {
  await GetStorage.init();
  Get.put(T9Controlcu()); 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      initValues();
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: TestDosyasi(),
      home: MenuPage(),
    );
  }

  initValues() {
    //program ilk çalıştırıldığında storage dan veri çekip gösterilecek yerlere atanır.Boş ise
    // default ayarlanmış olan 0 değeri atanır.

    GetStorage box = GetStorage();
    var controller = Get.find<T9Controlcu>();
    controller.cavalryRecruimentLv.value = box.read('t1a') == null
        ? controller.cavalryRecruimentLv.value
        : box.read('t1a');
    controller.squirehoodLv.value = box.read('t1b') == null
        ? controller.squirehoodLv.value
        : box.read('t1b');
    controller.warPathLv.value =
        box.read('t2') == null ? controller.warPathLv.value : box.read('t2');
    controller.plainSkirmishLv.value = box.read('t3a') == null
        ? controller.plainSkirmishLv.value
        : box.read('t3a');
    controller.ebonyBardingLv.value = box.read('t3b') == null
        ? controller.ebonyBardingLv.value
        : box.read('t3b');
    controller.empireDefenderLv.value = box.read('t4') == null
        ? controller.empireDefenderLv.value
        : box.read('t4');

    if (box.read('t9') != null) {
      controller.totalMedalLeftT9.value = box.read('t9');
    }
    if (box.read('total') != null) {
      controller.totalMedalLeft.value = box.read('total');
    }
    controller.yuzdeHesapla();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../t9controller.dart';

class ResearcherContainer extends StatelessWidget {
  const ResearcherContainer({
    Key key,
    @required this.researchTitle,
    this.controller,
    this.increase,
    this.decrease,
    this.researchID,
  }) : super(key: key);
  final String researchTitle;
  final Function increase;
  final Function decrease;
  final T9Controlcu controller;
  final int researchID;

  @override
  Widget build(BuildContext context) {
    initValues();
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: MediaQuery.of(context).size.width * 0.5 - 36,
        width: MediaQuery.of(context).size.width * 0.5 - 36,
        //color: Colors.red,
        child: Column(
          children: [
            Card(
              elevation: 15,
              child: Container(
                width: (MediaQuery.of(context).size.width * 0.5 - 36),

                height: (MediaQuery.of(context).size.width * 0.5 - 36) * 0.65,
                //color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Obx(() => Text(
                            '${showLevels(researchID)}',
                            style: TextStyle(fontSize: 30),
                          )),
                    ),
                    Divider(),
                    Text('$researchTitle', style: TextStyle(fontSize: 12)),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Obx(() => Text('${showMedals(researchID)}')),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    padding: EdgeInsets.all(8),
                    onPressed: increase,
                    height: 25,
                    minWidth: 40,
                    //color: Colors.blue,
                    child: Icon(Icons.add),
                  ),
                  MaterialButton(
                    padding: EdgeInsets.all(8),
                    onPressed: decrease,
                    height: 25,
                    minWidth: 40,
                    child: Icon(Icons.remove),
                  )
                ],
              ),
            )
          ],
        ),
      ),
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
    controller.squirehoodLv.value =
        box.read('t1b') == null ? controller.squirehoodLv.value : box.read('t1b');
    controller.warPathLv.value =
        box.read('t2') == null ? controller.warPathLv.value : box.read('t2');
    controller.plainSkirmishLv.value =
        box.read('t3a') == null ? controller.plainSkirmishLv.value : box.read('t3a');
    controller.ebonyBardingLv.value =
        box.read('t3b') == null ? controller.ebonyBardingLv.value : box.read('t3b');
    controller.empireDefenderLv.value =
        box.read('t4') == null ? controller.empireDefenderLv.value : box.read('t4');
  }

  int showLevels(int idForVariable) {
    switch (idForVariable) {
      case 0:
        return controller.cavalryRecruimentLv.value;
        break;
      case 1:
        return controller.squirehoodLv.value;
        break;
      case 2:
        return controller.warPathLv.value;
        break;
      case 3:
        return controller.plainSkirmishLv.value;
        break;
      case 4:
        return controller.ebonyBardingLv.value;
        break;
      case 5:
        return controller.empireDefenderLv.value;
        break;
      default:
        return 0;
    }
  }

  int showMedals(int idForVariable) {
    switch (idForVariable) {
      case 0:
        return controller.medalCavalryRecruiment1.value;
        break;
      case 1:
        return controller.medalSquirehood2.value;
        break;
      case 2:
        return controller.medalWarPath3.value;
        break;
      case 3:
        return controller.medalPlainSkirmish4.value;
        break;
      case 4:
        return controller.medalEbonyBarding5.value;
        break;
      case 5:
        return controller.medalEmpireDefender6.value;
        break;
      default:
        return 0;
    }
  }
}

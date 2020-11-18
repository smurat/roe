import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                      child: Text('4365'),
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

  int showLevels(int idForVariable) {
    switch (idForVariable) {
      case 0:
        return controller.cavalryRecruiment.value;
        break;
      case 1:
        return controller.squirehood.value;
        break;
      case 2:
        return controller.warPath.value;
        break;
      case 3:
        return controller.plainSkirmish.value;
        break;
      case 4:
        return controller.ebonyBarding.value;
        break;
      case 5:
        return controller.empireDefender.value;
        break;
      default:
        return 0;
    }
  }
}

import 'package:son_roe/events/utility/services_event.dart';

class MiddleSide extends StatelessWidget {
  const MiddleSide({Key key, @required this.controller}) : super(key: key);
  final ControllerDropdownMenu controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 75,
        child: Row(children: [
          Obx(() => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  padding: EdgeInsets.all(12),
                  height: 80,
                  width: MediaQuery.of(context).size.width - 16,
                  color: Colors.grey.shade800,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Castle Level :',
                          style: TextStyle(color: Colors.white),
                        ),
                        DropdownButton(
                            hint: Text('${controller.selectedItem}',
                                style: TextStyle(color: Colors.white)),
                            items: _getDropdownMenuItems(),
                            onChanged: (value) {
                              controller.updateSelectedItem(value);
                            })
                      ]))))
        ]));
  }

  List<DropdownMenuItem> _getDropdownMenuItems() {
    List<String> lvList = [
      '6-8',
      '9-10',
      '11-13',
      '14-16',
      '17-19',
      '20-22',
      '23-24',
      '25',
    ];
    return lvList
        .map((element) => DropdownMenuItem(
              child: Text('$element'),
              value: element,
            ))
        .toList();
  }
}

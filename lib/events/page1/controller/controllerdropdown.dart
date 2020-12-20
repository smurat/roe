import 'package:son_roe/events/utility/services_event.dart';

class ControllerDropdownMenu extends GetxController {
  var selectedItem = '6-8'.obs;
  var checkbox = false.obs;
  int castleLevelIndex=0;

  updateSelectedItem(
    String value,
  ) {
    selectedItem.value = value;
    //castleLevel=_convertSelectedItemToCastlv(value);
    castleLevelIndex = _convertSelectedItemToCastlv(value);    
  }

  int _convertSelectedItemToCastlv(String val) {
    return val == '6-8'
        ? 0
        : (val == '9-10'
            ? 1
            : (val == '11-13'
                ? 2
                : (val == '14-16'
                    ? 3
                    : (val == '17-19'
                        ? 4
                        : (val == '20-22'
                            ? 5
                            : (val == '23-24' ? 6 : (val == '25' ? 7 : 0)))))));
  }
}

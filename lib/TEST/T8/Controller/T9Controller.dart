import 'package:get/get.dart';

class TestT9Controller extends GetxController {
  Map<String, dynamic> myMap = {
    'cavalrylv': [0, 0, 0, 0, 0, 0]
  }.obs;
  Map<String, dynamic> myMap1 = {
    'cavalrylv': {'cavalryRecruimentLv': 0, 'squirehoodLv': 0}
  }.obs;

  List<int> levels = [0, 0, 0, 0, 0, 0].obs;

  arttir(int type, index) {
    switch (type) {
      case 1:
        // levels[index]++;
        myMap1['cavalrylv']['cavalryRecruimentLv']++;
        break;
      default:
    }
  }
}

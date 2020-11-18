import 'package:get/get.dart';

class T9Controlcu extends GetxController {
  var cavalryRecruiment = 0.obs;
  var squirehood = 0.obs;
  var warPath = 0.obs;
  var plainSkirmish = 0.obs;
  var ebonyBarding = 0.obs;
  var empireDefender = 0.obs;

  arttir(int id) {
    switch (id) {
      case 0:
        cavalryRecruiment.value++;
        break;
      case 1:
        squirehood.value++;
        break;
      case 2:
        warPath.value++;
        break;
      case 3:
        plainSkirmish.value++;
        break;
      case 4:
        ebonyBarding.value++;
        break;
      case 5:
        empireDefender.value++;
        break;
      default:
    }
  }

  azalt(int id) {
    switch (id) {
      case 0:
        cavalryRecruiment.value--;
        break;
      case 1:
        squirehood.value--;
        break;
      case 2:
        warPath.value--;
        break;
      case 3:
        plainSkirmish.value--;
        break;
      case 4:
        ebonyBarding.value--;
        break;
      case 5:
        empireDefender.value--;
        break;
      default:
    }
  }
}

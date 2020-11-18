import 'package:get/get.dart';

class T9Controlcu extends GetxController {
  
  var cavalryRecruimentLv = 0.obs;
  var squirehoodLv = 0.obs;
  var warPathLv = 0.obs;
  var plainSkirmishLv = 0.obs;
  var ebonyBardingLv = 0.obs;
  var empireDefenderLv = 0.obs;
  
  var medalCavalryRecruiment1 = 8760.obs;
  var medalSquirehood2 = 8760.obs;
  var medalWarPath3 = 11670.obs;
  var medalPlainSkirmish4 = 46700.obs;
  var medalEbonyBarding5 = 46700.obs;
  var medalEmpireDefender6 = 17500.obs;
  
  arttir(int id) {
    levelArttir(id);
    medalcalculate(id);
  }

  azalt(int id) {
    levelAzalt(id);
    medalcalculate(id);
  }

  levelArttir(int id) {
    switch (id) {
      case 0:
        if (cavalryRecruimentLv.value < 15) {
          cavalryRecruimentLv.value++;
        }
        break;
      case 1:
        if (squirehoodLv.value < 15) {
          squirehoodLv.value++;
        }
        break;
      case 2:
        if (warPathLv.value < 10) {
          warPathLv.value++;
        }
        break;
      case 3:
        if (plainSkirmishLv.value < 20) {
          plainSkirmishLv.value++;
        }
        break;
      case 4:
        if (ebonyBardingLv.value < 20) {
          ebonyBardingLv.value++;
        }
        break;
      case 5:
        if (empireDefenderLv.value < 1) {
          empireDefenderLv.value++;
        }
        break;
      default:
    }
  }

  levelAzalt(int id) {
    switch (id) {
      case 0:
        if (cavalryRecruimentLv.value > 0) {
          cavalryRecruimentLv.value--;
        }
        break;
      case 1:
        if (squirehoodLv.value > 0) {
          squirehoodLv.value--;
        }
        break;
      case 2:
        if (warPathLv.value > 0) {
          warPathLv.value--;
        }
        break;
      case 3:
        if (plainSkirmishLv.value > 0) {
          plainSkirmishLv.value--;
        }
        break;
      case 4:
        if (ebonyBardingLv.value > 0) {
          ebonyBardingLv.value--;
        }
        break;
      case 5:
        if (empireDefenderLv.value > 0) {
          empireDefenderLv.value--;
        }
        break;
      default:
    }
  }

  medalcalculate(int id) {
    switch (id) {
      case 0:
        if (cavalryRecruimentLv.value < 16) {
          medalCavalryRecruiment1.value =
              cavalryRecruitmentList[cavalryRecruimentLv.value];
        }
        break;
      case 1:
        if (cavalryRecruimentLv.value < 16) {
          medalSquirehood2.value = cavalryRecruitmentList[squirehoodLv.value];
        }

        break;
      case 2:
        if (warPathLv.value < 11) {
          medalWarPath3.value = warPathList[warPathLv.value];
        }
        break;
      case 3:
        if (plainSkirmishLv.value < 21) {
          medalPlainSkirmish4.value = ebonyBardingList[plainSkirmishLv.value];
        }
        break;
      case 4:
        if (ebonyBardingLv.value < 21) {
          medalEbonyBarding5.value = ebonyBardingList[ebonyBardingLv.value];
        }
        break;
      case 5:
        if (empireDefenderLv < 2) {
          medalEmpireDefender6.value = epireDefenderList[empireDefenderLv.value];
        }
        break;
      default:
    }
  }

  List<int> cavalryRecruitmentList = [
    8760,
    8580,
    8390,
    8190,
    7980,
    7750,
    7500,
    7220,
    6890,
    6490,
    6010,
    5390,
    4580,
    3530,
    2060,
    0
  ];
  List<int> warPathList = [
    11670,
    11490,
    11270,
    11010,
    10670,
    10220,
    9580,
    8640,
    7140,
    4590,
    0
  ];
  List<int> ebonyBardingList = [
    46700,
    46100,
    45470,
    44810,
    44120,
    43390,
    42590,
    41710,
    40740,
    39680,
    38510,
    37220,
    35680,
    33830,
    31610,
    28940,
    25740,
    21580,
    16170,
    9140,
    0
  ];
  List<int> epireDefenderList = [17500, 0];
}
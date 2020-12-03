import 'package:get/get.dart';
import 'package:son_roe/parts/t9calculator/pages/t9model.dart';

class T9ControllerCavalry extends GetxController {
  final model = T9Model(
          type: 'Cavalry',
          levels: [0, 0, 0, 0, 0, 0],
          medals: [8760, 8760, 11670, 46700, 46700, 17500],
          t9Left: 131380,
          totalLeft: 140090,
          percentage: 0.0)
      .obs;

  arttir(int index) {
    model.update((val) {
      levelArttir(index, val);
      medalcalculate(index, val);
      yuzdeHesapla(index);
    });
  }

  azalt(int index) {
    model.update((val) {
      levelAzalt(index, val);
      medalcalculate(index, val);
      yuzdeHesapla(index);
    });
  }

  reset() {
    model.update((val) {
      val.levels = [0, 0, 0, 0, 0, 0];
      val.medals = [8760, 8760, 11670, 46700, 46700, 17500];
      val.t9Left = 131380;
      val.totalLeft = 140090;
      val.percentage = 0.0;
    });
  }

  yuzdeHesapla(int index) {
    int toplam = 81;
    int current = 0;

    model.update((val) {
      val.levels.forEach((element) {
        current += element;
      });
      val.percentage = current / toplam;
    });
  }

  levelArttir(int index, T9Model val) {
    switch (index) {
      case 0:
        if (val.levels[index] < 15) {
          val.levels[index]++;

          val.totalLeft -= cavalryRecruitmentsFARK[val.levels[index] - 1];
          if (val.levels[index] != 15) {
            val.t9Left -= cavalryRecruitmentsFARK[val.levels[index] - 1];
          }
        }
        break;
      case 1:
        if (val.levels[index] < 15) {
          val.levels[index]++;
          val.totalLeft -= cavalryRecruitmentsFARK[val.levels[index] - 1];

          if (val.levels[index] != 15) {
            val.t9Left -= cavalryRecruitmentsFARK[val.levels[index] - 1];
          }
        }
        break;
      case 2:
        if (val.levels[index] < 10) {
          val.levels[index]++;
          val.totalLeft -= warPathFARK[val.levels[index] - 1];

          if (val.levels[index] != 10) {
            val.t9Left -= warPathFARK[val.levels[index] - 1];
          }
        }
        break;

      case 3:
        if (val.levels[index] < 20) {
          val.levels[index]++;

          val.totalLeft -= plainSkirmishFARK[val.levels[index] - 1];
          val.t9Left -= plainSkirmishFARK[val.levels[index] - 1];
        }
        break;

      case 4:
        if (val.levels[index] < 20) {
          val.levels[index]++;
          val.totalLeft -= plainSkirmishFARK[val.levels[index] - 1];
          val.t9Left -= plainSkirmishFARK[val.levels[index] - 1];
        }
        break;
      case 5:
        if (val.levels[index] < 1) {
          val.levels[index]++;
          val.totalLeft -= empireDefenderFARK[val.levels[index] - 1];
          val.t9Left -= empireDefenderFARK[val.levels[index] - 1];
        }
        break;
      default:
    }
  }

  levelAzalt(int index, T9Model val) {
    switch (index) {
      case 0:
        if (val.levels[index] > 0) {
          val.levels[index]--;          
          val.totalLeft += cavalryRecruitmentsFARK[val.levels[index]];

          if (val.levels[index] != 14) {
            val.t9Left += cavalryRecruitmentsFARK[val.levels[index]];
          }
        }
        break;
      case 1:
        if (val.levels[index] > 0) {
          val.levels[index]--;
          val.totalLeft += cavalryRecruitmentsFARK[val.levels[index]];

          if (val.levels[index] != 14) {
            val.t9Left += cavalryRecruitmentsFARK[val.levels[index]];
          }
        }
        break;
      case 2:
        if (val.levels[index] > 0) {
          val.levels[index]--;
          val.totalLeft += warPathFARK[val.levels[index]];

          if (val.levels[index] != 9) {
            val.t9Left += warPathFARK[val.levels[index]];
          }
        }
        break;
      case 3:
        if (val.levels[index] > 0) {
          val.levels[index]--;

          val.totalLeft += plainSkirmishFARK[val.levels[index]];
          val.t9Left += plainSkirmishFARK[val.levels[index]];
        }
        break;
      case 4:
        if (val.levels[index] > 0) {
          val.levels[index]--;

          val.totalLeft += plainSkirmishFARK[val.levels[index]];
          val.t9Left += plainSkirmishFARK[val.levels[index]];
        }
        break;
      case 5:
        if (val.levels[index] > 0) {
          val.levels[index]--;

          val.totalLeft += empireDefenderFARK[val.levels[index]];
          val.t9Left += empireDefenderFARK[val.levels[index]];
        }
        break;
      default:
    }
  }

  medalcalculate(int index, T9Model val) {
    switch (index) {
      case 0:
        if (val.levels[index] < 16) {
          val.medals[index] = cavalryRecruitmentList[val.levels[index]];
        }
        break;
      case 1:
        if (val.levels[index] < 16) {
          val.medals[index] = cavalryRecruitmentList[val.levels[index]];
        }

        break;
      case 2:
        if (val.levels[index] < 11) {
          val.medals[index] = warPathList[val.levels[index]];
        }
        break;
      case 3:
        if (val.levels[index] < 21) {
          val.medals[index] = ebonyBardingList[val.levels[index]];
        }
        break;
      case 4:
        if (val.levels[index] < 21) {
          val.medals[index] = ebonyBardingList[val.levels[index]];
        }
        break;
      case 5:
        if (val.levels[index] < 2) {
          val.medals[index] = empireDefenderList[val.levels[index]];
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
  List<int> empireDefenderList = [17500, 0];

  List<int> cavalryRecruitmentsFARK = [
    180,
    190,
    200,
    210,
    230,
    250,
    280,
    330,
    400,
    480,
    620,
    810,
    1050,
    1470,
    2060
  ];
  List<int> warPathFARK = [180, 220, 260, 340, 450, 640, 940, 1500, 2550, 4590];
  List<int> plainSkirmishFARK = [
    600,
    630,
    660,
    690,
    730,
    800,
    880,
    970,
    1060,
    1170,
    1290,
    1540,
    1850,
    2220,
    2670,
    3200,
    4160,
    5410,
    7030,
    9140,
  ];
  List<int> empireDefenderFARK = [17500, 0];
}

/**
 * 
 * 
 * var cavalryRecruimentLv = 0.obs;
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

  var totalMedalLeft = 140090.obs;
  var totalMedalLeftT9 = 131380.obs;

  var percentage = (0.0).obs;
 */

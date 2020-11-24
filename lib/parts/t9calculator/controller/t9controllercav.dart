import 'package:get/get.dart';

class T9CavalryController extends GetxController {
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

  var totalMedalLeft = 140090.obs;
  var totalMedalLeftT9 = 131380.obs;

  var percentage = (0.0).obs;

  arttir(int id) {
    levelArttir(id);
    medalcalculate(id);
    yuzdeHesapla();
  }

  azalt(int id) {
    levelAzalt(id);
    medalcalculate(id);
    yuzdeHesapla();
  }

  yuzdeHesapla() {
    int toplam = 81;
    int current = cavalryRecruimentLv.value +
        squirehoodLv.value +
        warPathLv.value +
        plainSkirmishLv.value +
        ebonyBardingLv.value +
        empireDefenderLv.value;
    percentage.value = current / toplam;
  }

  levelArttir(int id) {
    switch (id) {
      case 0:
        if (cavalryRecruimentLv.value < 15) {
          cavalryRecruimentLv.value++;
          totalMedalLeft -=
              cavalryRecruitmentsFARK[cavalryRecruimentLv.value - 1];
          if (cavalryRecruimentLv.value != 15) {
            totalMedalLeftT9 -=
                cavalryRecruitmentsFARK[cavalryRecruimentLv.value - 1];
          }
          print(totalMedalLeft);
        }
        break;
      case 1:
        if (squirehoodLv.value < 15) {
          squirehoodLv.value++;
          totalMedalLeft -= cavalryRecruitmentsFARK[squirehoodLv.value-1];

          if (squirehoodLv.value != 15) {
            totalMedalLeftT9 -= cavalryRecruitmentsFARK[squirehoodLv.value-1];
          }
        }
        break;
      case 2:
        if (warPathLv.value < 10) {
          warPathLv.value++;
          totalMedalLeft -= warPathFARK[warPathLv.value-1];

          if (warPathLv.value != 10) {
            totalMedalLeftT9 -= warPathFARK[warPathLv.value-1];
          }
        }
        break;
      case 3:
        if (plainSkirmishLv.value < 20) {
          plainSkirmishLv.value++;

          totalMedalLeft -= plainSkirmishFARK[plainSkirmishLv.value-1];
          totalMedalLeftT9 -= plainSkirmishFARK[plainSkirmishLv.value-1];
        }
        break;
      case 4:
        if (ebonyBardingLv.value < 20) {
          ebonyBardingLv.value++;
          totalMedalLeft -= plainSkirmishFARK[ebonyBardingLv.value-1];
          totalMedalLeftT9 -= plainSkirmishFARK[ebonyBardingLv.value-1];
        }
        break;
      case 5:
        if (empireDefenderLv.value < 1) {
          empireDefenderLv.value++;
          totalMedalLeft -= empireDefenderFARK[empireDefenderLv.value-1];
          totalMedalLeftT9 -= empireDefenderFARK[empireDefenderLv.value-1];
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
          print(cavalryRecruimentLv.value);
          totalMedalLeft += cavalryRecruitmentsFARK[cavalryRecruimentLv.value];

          if (cavalryRecruimentLv.value != 14) {
            totalMedalLeftT9 +=
                cavalryRecruitmentsFARK[cavalryRecruimentLv.value];
          }
        }
        break;
      case 1:
        if (squirehoodLv.value > 0) {
          squirehoodLv.value--;
          totalMedalLeft += cavalryRecruitmentsFARK[squirehoodLv.value];

          if (squirehoodLv.value != 14) {
            totalMedalLeftT9 += cavalryRecruitmentsFARK[squirehoodLv.value];
          }
        }
        break;
      case 2:
        if (warPathLv.value > 0) {
          warPathLv.value--;          
          totalMedalLeft += warPathFARK[warPathLv.value];

          if (warPathLv.value != 9) {
            totalMedalLeftT9 += warPathFARK[warPathLv.value];
          }
        }
        break;
      case 3:
        if (plainSkirmishLv.value > 0) {
          plainSkirmishLv.value--;

          totalMedalLeft += plainSkirmishFARK[plainSkirmishLv.value];
          totalMedalLeftT9 += plainSkirmishFARK[plainSkirmishLv.value];
        }
        break;
      case 4:
        if (ebonyBardingLv.value > 0) {
          ebonyBardingLv.value--;

          totalMedalLeft += plainSkirmishFARK[ebonyBardingLv.value];
          totalMedalLeftT9 += plainSkirmishFARK[ebonyBardingLv.value];
        }
        break;
      case 5:
        if (empireDefenderLv.value > 0) {
          empireDefenderLv.value--;

          totalMedalLeft += empireDefenderFARK[empireDefenderLv.value];
          totalMedalLeftT9 += empireDefenderFARK[empireDefenderLv.value];
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
          medalEmpireDefender6.value =
              empireDefenderList[empireDefenderLv.value];
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
  List<int> empireDefenderList = [17500,0];

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
  List<int> empireDefenderFARK = [17500,0];
}

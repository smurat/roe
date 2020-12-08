import 'package:son_roe/parts/t9calculator/services_t9.dart';
import 'package:son_roe/parts/zoneconflict/controller/controller_zoneconflict.dart';
import 'package:son_roe/parts/zoneconflict/utility/model_zoneconflict.dart';

//TODO ZONE CONFLICT STORAGE İŞLERİNİ HALLET
void main() async {
  await GetStorage.init();
  initController();
  runApp(MyApp());
}

void initController() {
  _initControllers();
  _initValues();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: TestDosyasi(),
      home: MenuPage(),
      // home: TESTT9MenuPage(),
      // home:EventMainPage()
    );
  }
}

/// stat the contollers
void _initControllers() {
  Get.put(ControllerT9Cavalry());
  Get.put(ControllerT9Archer());
  Get.put(ControllerT9Footman());
  Get.put(ControllerZoneConflict());
}

void _initValues() {
  GetStorage box = GetStorage();

  if (box.read('Cavalry') != null) {
    T9Model model = Get.find<ControllerT9Cavalry>().model.value;

    model.levels = List<int>.from(box.read('Cavalry')[0]);
    model.medals = List<int>.from(box.read('Cavalry')[1]);
    model.t9Left = box.read('Cavalry')[2];
    model.totalLeft = box.read('Cavalry')[3];
    model.percentage = box.read('Cavalry')[4];
  }
  if (box.read('Archer') != null) {
    T9Model model = Get.find<ControllerT9Archer>().model.value;

    model.levels = List<int>.from(box.read('Archer')[0]);
    model.medals = List<int>.from(box.read('Archer')[1]);
    model.t9Left = box.read('Archer')[2];
    model.totalLeft = box.read('Archer')[3];
    model.percentage = box.read('Archer')[4];
  }
  if (box.read('Footman') != null) {
    T9Model model = Get.find<ControllerT9Footman>().model.value;

    model.levels = List<int>.from(box.read('Footman')[0]);
    model.medals = List<int>.from(box.read('Footman')[1]);
    model.t9Left = box.read('Footman')[2];
    model.totalLeft = box.read('Footman')[3];
    model.percentage = box.read('Footman')[4];
  }
  if (box.read('Zone Conflict') != null) {
    ZoneConflictModel model = Get.find<ControllerZoneConflict>().model.value;
    model.levels = List<int>.from(box.read('Zone Conflict')[0]);
    model.medals = List<int>.from(box.read('Zone Conflict')[1]);
    model.totalLeft = box.read('Zone Conflict')[2];
    model.percentage = box.read('Zone Conflict')[3];
  }
}

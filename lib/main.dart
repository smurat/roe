import 'package:son_roe/servisler.dart';

void main() async {
  //FIXME Get Storage ve init KAPALI
  await GetStorage.init();
  initController();
  runApp(MyApp());
}

void initController() {
  Get.put(T9ControllerCavalry());
  Get.put(T9ControllerArcher());
  Get.put(T9ControllerFootman());
  initValues();
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

initValues() {
  GetStorage box = GetStorage();

  if (box.read('Cavalry') != null) {
    T9Model model = Get.find<T9ControllerCavalry>().model.value;

    model.levels = List<int>.from(box.read('Cavalry')[0]);
    model.medals = List<int>.from(box.read('Cavalry')[1]);
    model.t9Left = box.read('Cavalry')[2];
    model.totalLeft = box.read('Cavalry')[3];
    model.percentage = box.read('Cavalry')[4];
   
  }
  if (box.read('Archer') != null) {
    T9Model model = Get.find<T9ControllerArcher>().model.value;

    model.levels = List<int>.from(box.read('Archer')[0]);
    model.medals = List<int>.from(box.read('Archer')[1]);
    model.t9Left = box.read('Archer')[2];
    model.totalLeft = box.read('Archer')[3];
    model.percentage = box.read('Archer')[4];
  }
  if (box.read('Footman') != null) {
    T9Model model = Get.find<T9ControllerFootman>().model.value;

    model.levels = List<int>.from(box.read('Footman')[0]);
    model.medals = List<int>.from(box.read('Footman')[1]);
    model.t9Left = box.read('Footman')[2];
    model.totalLeft = box.read('Footman')[3];
    model.percentage = box.read('Footman')[4];
  }
}

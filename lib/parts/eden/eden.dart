import 'package:flutter/material.dart';
import 'package:son_roe/parts/eden/databasehelper.dart';
import 'package:son_roe/parts/eden/modeleden.dart';
import 'package:son_roe/parts/zoneconflict/utility/services_zoneconflict.dart';

class MainEDEN extends StatefulWidget {
  @override
  _MainEDENState createState() => _MainEDENState();
}

class _MainEDENState extends State<MainEDEN>
    with SingleTickerProviderStateMixin {
  TabController controller;
  List<String> _tabTitles = ['I', 'II', 'III', 'IV', 'V'];
  ControllerEDEN controllerEDEN;
  DatabaseHelper _helper;

  @override
  void initState() {
    super.initState();
    _helper = DatabaseHelper();
    controllerEDEN = Get.find<ControllerEDEN>();
    controller = new TabController(length: _tabTitles.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            forceElevated: innerBoxIsScrolled,
            floating: false,
            pinned: true,
            primary: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(
                  MediaQuery.of(context).size.height * 0.26), // Add this code
              child: ColoredTabBar(
                color: Colors.black.withOpacity(0.5),
                tabBar: TabBar(
                    controller: controller,
                    tabs: _tabTitles
                        .map((e) => Tab(
                              child: Text(e),
                            ))
                        .toList()),
              ),
            ),
            // expandedHeight: MediaQuery.of(context).size.height * 0.35,
            flexibleSpace: Container(
              child: Image.asset(
                'assets/images/eden.png',
                fit: BoxFit.fill,
              ),
            ),
            title: Text("Roc Building Queue"),
          )
        ];
      }, body: Obx(() {
        List<ModelRoc> listAll = [];
        (controllerEDEN.list[0] as List).forEach((element) {
          listAll.add(element);
        });
        List<List<ModelRoc>> speratedList = _seperateToList(listAll);
        return TabBarView(
            controller: controller,
            children: [
              buildListView(speratedList[0]),
              buildListView(speratedList[1]),
              buildListView(speratedList[2]),
              buildListView(speratedList[3]),
              buildListView(speratedList[4], color: Colors.green),
            ],
            physics: NeverScrollableScrollPhysics());
      })),
    );
  }

  buildListView(List<ModelRoc> speratedList, {Color color}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          itemCount: speratedList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: ObjectKey([speratedList[index].id]),
              child: Card(
                  elevation: 3,
                  child: Container(
                    height: 70,
                    child: ListTile(
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Sıra : ${speratedList[index].id}',
                              style: TextStyle(color: color)),
                          Text('(Lv : ${speratedList[index].levels})',
                              style: TextStyle(color: color)),
                        ],
                      ),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '${speratedList[index].name}',
                            style: TextStyle(fontSize: 20, color: color),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Material Cost: ',
                                  style: TextStyle(fontSize: 14, color: color)),
                              Text('${speratedList[index].bcmaterials}',
                                  style: TextStyle(fontSize: 18, color: color)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
              onDismissed: (direction) {
                ModelRoc newModel = ModelRoc(
                    id: speratedList[index].id,
                    sector: speratedList[index].sector,
                    name: speratedList[index].name,
                    bcmaterials: speratedList[index].bcmaterials,
                    levels: speratedList[index].levels,
                    isDone: (speratedList[index].isDone == 0) ? 1 : 0);

                _helper.updateModel(newModel);
                controllerEDEN.updateList();
              },
            );
          },
        ),
      ),
    );
  }

  Future<List<ModelRoc>> fetchEdenDB() async {
    print('EDEN LİST CAGIRILDI');
    List<ModelRoc> _listRoc = List();
    await getIt<DatabaseHelper>().getList().then((value) {
      (value as List).forEach((element) {
        _listRoc.add(ModelRoc(
          id: element['id'],
          sector: element['sector'],
          name: element['name'],
          bcmaterials: element['bcmaterials'],
          levels: element['levels'],
          isDone: element['isDone'],
        ));
      });
    });
    print(_listRoc.length);
    return _listRoc;
  }

  List<List<ModelRoc>> _seperateToList(List<ModelRoc> list) {
    List<ModelRoc> list1 = List();
    List<ModelRoc> list2 = List();
    List<ModelRoc> list3 = List();
    List<ModelRoc> list4 = List();
    List<ModelRoc> list5 = List();
    list.forEach((model) {
      if (model.sector == 1 && model.isDone == 0) {
        list1.add(model);
      } else if (model.sector == 2 && model.isDone == 0) {
        list2.add(model);
      } else if (model.sector == 3 && model.isDone == 0) {
        list3.add(model);
      } else if (model.sector == 4 && model.isDone == 0) {
        list4.add(model);
      } else if (model.isDone == 1) {
        list5.add(model);
      }
    });
    return [list1, list2, list3, list4, list5];
  }
}

class ControllerEDEN extends GetxController {
  var list = [].obs;
  updateList() async {
    try {
      await fetchEdenDB().then((value) {
        value != null ? list.assign(value) : null;
      });
    } catch (e) {}
  }

  @override
  void onInit() async {
    try {
      await fetchEdenDB().then((value) {
        list.assign(value); // [[80 tane item]]
      });
    } catch (e) {}

    super.onInit();
  }

  Future<List<ModelRoc>> fetchEdenDB() async {
    print('EDEN LİST CAGIRILDI');
    List<ModelRoc> _listRoc = List();
    await getIt<DatabaseHelper>().getList().then((value) {
      (value as List).forEach((element) {
        _listRoc.add(ModelRoc(
          id: element['id'],
          sector: element['sector'],
          name: element['name'],
          bcmaterials: element['bcmaterials'],
          levels: element['levels'],
          isDone: element['isDone'],
        ));
      });
    });
    return _listRoc;
  }
}

class ColoredTabBar extends Container implements PreferredSizeWidget {
  ColoredTabBar({this.color = Colors.transparent, @required this.tabBar});

  final Color color;
  final TabBar tabBar;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => Container(
        color: color,
        child: tabBar,
      );
}

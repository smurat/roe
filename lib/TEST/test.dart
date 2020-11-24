import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:time_machine/time_machine.dart';

class TestDosyasi extends StatefulWidget {
  @override
  _TestDosyasiState createState() => _TestDosyasiState();
}

class _TestDosyasiState extends State<TestDosyasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            myTime();
          },
        ),
        appBar: AppBar(
          title: Text('TEST'),
        ),
        body: FutureBuilder(
          future: myTime(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Text('${snapshot.data[index]}');
                },
              );
            } else {
              return Container();
            }
          },
        ));
  }

  Future<List<String>> myTime() async {
    try {
      await TimeMachine.initialize({
        'rootBundle': rootBundle,
      });
      var tzdb = await DateTimeZoneProviders.tzdb;
      var noronha = await tzdb['America/Noronha'];
      var now = Instant.now();
      print('1-> Noronha ==== ${now.inZone(noronha).clockTime}');
      
      

     // print('2-> '+DateTimeZone.local.toString());
     // print('3-> UTC time ${now}');
      
      return tzdb.ids;
    } catch (e) {
      print(e);
      return ['null'];
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:son_roe/parts/t9calculator/t9mainpage.dart';

class T9ManuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  expandedHeight: 200,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/dragon.jpg'))),
                    ),
                  ),
                )
              ];
            },
            body: Container(
              color: Colors.black87.withOpacity(0.9),
              child: ListView(
                children: [
                  InkWell(
                    child: T9MenuPageItemWidget(
                      image: 'assets/images/f1.png',
                      percentage: 40,
                      title: 'FOOTMAN',
                    ),
                    onTap: () {
                      Get.to(T9MainPage());
                    },
                  ),
                  T9MenuPageItemWidget(
                    image: 'assets/images/a1.png',
                    percentage: 22,
                    title: 'ARCHER',
                  ),
                  T9MenuPageItemWidget(
                    image: 'assets/images/c1.png',
                    percentage: 68,
                    title: 'CAVALRY',
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

class T9MenuPageItemWidget extends StatelessWidget {
  const T9MenuPageItemWidget({
    Key key,
    @required this.image,
    this.percentage = 0,
    this.medal = 0,
    this.title,
  }) : super(key: key);
  final String image;
  final int percentage;
  final int medal;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 10, right: 10, bottom: 10),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
            border: Border.all(width: 0.2),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.2),
                spreadRadius: 2,
                offset: Offset(6, 6),
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Container(
              child: Image.asset(
                image,
              ),
              width: 120,
            ),
            VerticalDivider(
              thickness: 1,
              endIndent: 12,
              indent: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LinearPercentIndicator(
                      width: 180,
                      lineHeight: 12,
                      curve: Curves.linear,
                      percent: percentage / 100,
                      progressColor: Colors.blue,
                      center: Text(
                        '$percentage %',
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                  Row(
                    children: [Text('Left Medal : '), Text('$medal')],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

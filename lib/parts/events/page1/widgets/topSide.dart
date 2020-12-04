import 'package:flutter/material.dart';

class TopSide extends StatelessWidget {
  const TopSide({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.19,
      child: Column(
        children: [
          Row(
            children: [
              TopLeftWidget(),
              TopRightWidget()
            ],
          ),
          Row(
            children: [
              BottomLeftWidget(),
              BottomRightWidget()
            ],
          ),
        ],
      ),
    );
  }
}



class TopRightWidget extends StatelessWidget {
  const TopRightWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 10, 8, 0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.61,
        height: MediaQuery.of(context).size.height * 0.08,
        color: Colors.grey.shade800,
      ),
    );
  }
}

class TopLeftWidget extends StatelessWidget {
  const TopLeftWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 10, 0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.31,
        height: MediaQuery.of(context).size.height * 0.08,
        color: Colors.grey.shade800,
      ),
    );
  }
}

class BottomLeftWidget extends StatelessWidget {
  const BottomLeftWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 10, 0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.31,
        height: MediaQuery.of(context).size.height * 0.08,
        color: Colors.grey.shade800,
      ),
    );
  }
}

class BottomRightWidget extends StatelessWidget {
  const BottomRightWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 10, 8, 0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.61,
        height: MediaQuery.of(context).size.height * 0.08,
        color: Colors.grey.shade800,
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:son_roe/events/utility/services_event.dart';

class MiddleSide extends StatelessWidget {
  const MiddleSide({Key key, @required List contentList})
      : _contentList = contentList,
        super(key: key);

  final List _contentList;//FIXME Buraya Liste gönder
  @override
  Widget build(BuildContext context) {
    return Expanded(
     child: Container(
        
      )
    );
  }
}

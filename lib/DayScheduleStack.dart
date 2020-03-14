import 'package:flutter/material.dart';

import 'TestDayData.dart';

class DayScheduleStack extends StatefulWidget {
  final String title;
  final List<Widget> appointments;
  DayScheduleStack({
    Key key,
    @required this.title,
    @required this.appointments,
  }) : super(key: key);

  DayScheduleStackState createState() => DayScheduleStackState();
}

class DayScheduleStackState extends State<DayScheduleStack> {
  List<Widget> appointments;
  DayScheduleStackState({this.appointments});
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      alignment: Alignment.center,
      children: [TestDayData(day: widget.title), ...widget.appointments],
    );
  }
}

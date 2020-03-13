import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gcfd/TestTimeTable.dart';

import 'AppointmentBox.dart';
import 'package:provider/provider.dart';
import 'TestDayData.dart';
import 'provider/CalendarData.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CalendarData()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'DataTable Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var title1 = "Monday\n03-09-2020";
    List<Widget> appointments1 = [
      AppointmentBox(
          topVal: (2 * 24 + 55).toDouble(),
          color: Colors.purple,
          height: (3 * 24.0),
          text: "Place #1"),
      AppointmentBox(
          topVal: (8 * 24 + 55).toDouble(),
          color: Colors.purple,
          height: (4 * 24.0),
          text: "Place #2"),
    ];
    List<Widget> appointments2 = [
      AppointmentBox(
          topVal: (55 + 4 * 24.0),
          color: Colors.green,
          height: (2 * 24.0),
          text: "Place #3"),
      AppointmentBox(
          topVal: (55 + 10 * 24.0),
          color: Colors.orange,
          height: (4 * 24.0),
          text: "Place #4"),
    ];
    String clickedValue =
        Provider.of<CalendarData>(context, listen: true).testing;
    return Scaffold(
      key: _drawerKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: Text(clickedValue),
              onTap: () {
                Provider.of<CalendarData>(context, listen: false).setText(
                    "Clicked inside drawer that's being displayed for $clickedValue");
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        shrinkWrap: true,
        // children: <Widget>[
        //   Row(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(width: 230, child: TestTimeTable()),
                DayScheduleStack(
                  title: title1,
                  appointments: appointments1,
                ),
                DayScheduleStack(
                  title: "Tuesday\n03-10-2020",
                  appointments: appointments2,
                ),
                TestDayData(day: "Wednesday\n03-11-2020"),
                TestDayData(day: "Thursday\n03-12-2020"),
                TestDayData(day: "Friday\n03-13-2020"),
                TestDayData(day: "Saturday\n03-14-2020"),
                TestDayData(day: "Sunday\n03-15-2020"),
              ],
            ),
          ),
        ],
        //   )
        // ],
      ),
    );
  }
}

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

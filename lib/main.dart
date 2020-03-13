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
                DayScheduleStack(),
                Stack(
                    fit: StackFit.loose,
                    alignment: Alignment.center,
                    children: [
                      TestDayData(day: "Tuesday\n03-10-2020"),
                      AppointmentBox(
                          topVal: 150.0,
                          color: Colors.green,
                          height: 100.0,
                          text: "Place #3"),
                      AppointmentBox(
                          topVal: 300.0,
                          color: Colors.orange,
                          height: 200.0,
                          text: "Place #4"),
                    ]),
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
  const DayScheduleStack({
    Key key,
  }) : super(key: key);

  DayScheduleStackState createState() => DayScheduleStackState();
}

class DayScheduleStackState extends State<DayScheduleStack> {
  var title = "Monday\n03-09-2020";
  List<Widget> appointments = [
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

  appointmentUnpack(int val) {
    return appointments[val];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      alignment: Alignment.center,
      children: [TestDayData(day: title), ...appointments],
    );
  }
}

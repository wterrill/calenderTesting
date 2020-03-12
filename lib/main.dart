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
    return Scaffold(
      key: _drawerKey,
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
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
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text(Provider.of<CalendarData>(context).testing),
              onTap: () {
                // Update the state of the app.
                // ...
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
        children: <Widget>[
          Row(
            children: [
              TestTimeTable(),
              Stack(
                fit: StackFit.loose,
                alignment: Alignment.center,
                children: [
                  TestDayData(day: "Monday\n03-09-2020"),
                  AppointmentBox(
                      topVal: 100.0,
                      color: Colors.purple,
                      height: 100.0,
                      text: "Place #1"),
                  AppointmentBox(
                      topVal: 300.0,
                      color: Colors.purple,
                      height: 200.0,
                      text: "Place #2"),
                ],
              ),
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
          )
        ],
      ),
    );
  }
}

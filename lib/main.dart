import 'package:flutter/material.dart';
import 'package:gcfd/TestTimeTable.dart';

import 'ScheduleDataTable.dart';
import 'TestDayData.dart';

void main() {
  runApp(MyApp());
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Row(
            children: [
              // Stack(
              //     fit: StackFit.loose,
              //     alignment: Alignment.center,
              //     children: [
              //       ScheduleDataTable(selectRowCallback: print),
              //       Positioned(
              //         top: 100,
              //         child: Container(
              //           decoration: new BoxDecoration(
              //             color: Colors.purple,
              //             // shape: Shapes.
              //             borderRadius:
              //                 new BorderRadius.all(new Radius.circular(15.0)),
              //           ),
              //           width: 290,
              //           height: 100,
              //           // color: Colors.green,
              //         ),
              //       ),
              //       Positioned(
              //         top: 300,
              //         child: Container(
              //           decoration: new BoxDecoration(
              //             color: Colors.purple,
              //             // shape: Shapes.
              //             borderRadius:
              //                 new BorderRadius.all(new Radius.circular(15.0)),
              //           ),
              //           width: 290,
              //           height: 200,
              //           // color: Colors.green,
              //         ),
              //       )
              //     ]),
              TestTimeTable(),
              Stack(
                  fit: StackFit.loose,
                  alignment: Alignment.center,
                  children: [
                    TestDayData(day: "   Monday\n 03-09-2020"),
                    Positioned(
                      top: 100,
                      child: Container(
                        child: Center(child: Text("Place #4")),
                        decoration: new BoxDecoration(
                          color: Colors.purple,
                          // shape: Shapes.
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(15.0)),
                        ),
                        width: 130,
                        height: 100,
                        // color: Colors.green,
                      ),
                    ),
                    Positioned(
                      top: 300,
                      child: Container(
                        child: Center(child: Text("Place #3")),
                        decoration: new BoxDecoration(
                          color: Colors.purple,
                          // shape: Shapes.
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(15.0)),
                        ),
                        width: 130,
                        height: 200,
                        // color: Colors.green,
                      ),
                    )
                  ]),
              Stack(
                  fit: StackFit.loose,
                  alignment: Alignment.center,
                  children: [
                    TestDayData(day: "   Tuesday\n 03-10-2020"),
                    Positioned(
                      top: 150,
                      child: Container(
                        child: Center(child: Text("Place #1")),
                        decoration: new BoxDecoration(
                          color: Colors.green,
                          // shape: Shapes.
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(15.0)),
                        ),
                        width: 130,
                        height: 100,
                        // color: Colors.green,
                      ),
                    ),
                    Positioned(
                      top: 300,
                      child: Container(
                        child: Center(child: Text("Place #2")),
                        decoration: new BoxDecoration(
                          color: Colors.orange,
                          // shape: Shapes.
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(15.0)),
                        ),
                        width: 130,
                        height: 200,
                        // color: Colors.green,
                      ),
                    )
                  ]),
              TestDayData(day: "   Tuesday\n 03-10-2020"),
              TestDayData(day: " Wednesday\n 03-11-2020"),
              TestDayData(day: "  Thursday\n 03-12-2020"),
              TestDayData(day: "    Friday\n 03-13-2020"),
              TestDayData(day: "  Saturday\n 03-14-2020"),
              TestDayData(day: "    Sunday\n 03-15-2020"),
              // Stack(children: [ScheduleDataTable(selectRowCallback: print)]),
              // Stack(children: [ScheduleDataTable(selectRowCallback: print)]),
            ],
          )
        ],
      ),
    );
  }
}

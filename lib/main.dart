import 'package:flutter/material.dart';

import 'ScheduleDataTable.dart';

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
            Row(children: [
              Stack(
                  fit: StackFit.loose,
                  alignment: Alignment.center,
                  children: [
                    ScheduleDataTable(selectRowCallback: print),
                    Positioned(
                      top: 100,
                      child: Container(
                        decoration: new BoxDecoration(
                          color: Colors.purple,
                          // shape: Shapes.
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(15.0)),
                        ),
                        width: 290,
                        height: 100,
                        // color: Colors.green,
                      ),
                    ),
                    Positioned(
                      top: 300,
                      child: Container(
                        decoration: new BoxDecoration(
                          color: Colors.purple,
                          // shape: Shapes.
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(15.0)),
                        ),
                        width: 290,
                        height: 200,
                        // color: Colors.green,
                      ),
                    )
                  ]),
              Stack(children: [ScheduleDataTable(selectRowCallback: print)]),
              Stack(children: [ScheduleDataTable(selectRowCallback: print)]),
            ])
          ],
        ));
  }
}

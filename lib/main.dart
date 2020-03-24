import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gcfd/TestTimeTable.dart';

import 'AppointmentBox.dart';
import 'package:provider/provider.dart';
import 'ColorDef.dart';
import 'DayScheduleStack.dart';
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
    var testArray = Provider.of<CalendarData>(context).testArray;
// json:
//     title:
//         appointments:
//            start:
//            color:
//            duration:
//            text:

    createAppointmentsFromArray(var data) {
      print("Entered createAppointmentsFromArray");
      // var colors = {
      //   'purple': Colors.purple,
      //   'yellow': Colors.yellow,
      //   'green': Colors.green,
      //   'orange': Colors.orange
      // };

      // var appoint = data.appoinments.map((appt)=>{

      // });

      var currentPage = [];
      data.forEach((day) {
        List<Widget> appoint = [];
        day['appointments'].forEach((appt) {
          // print(appt['start']);
          // print(appt['color']);

          appoint.add(
            AppointmentBox(
              key: UniqueKey(),
              topVal: (appt['start'] * 24 + 55).toDouble(),
              color: ColorDef.colors[appt['color']],
              duration: (appt['duration'] * 24.0),
              text: appt['text'],
            ),
          );
        });
        print(appoint);
        currentPage.add(DayScheduleStack(
            title: day['DOW'] + "\n" + day['date'], appointments: appoint));
      });
      return currentPage;
    }

    Widget createAppointmentFromArray(Map<String, dynamic> data) {
      List<Widget> appoint = [];
      data['appointments'].forEach((appt) {
        appoint.add(
          AppointmentBox(
            key: UniqueKey(),
            topVal: (appt['start'] * 24 + 55).toDouble(),
            color: ColorDef.colors[appt['color']],
            duration: (appt['duration'] * 24.0),
            text: appt['text'],
          ),
        );
      });
      return (DayScheduleStack(
          title: data['DOW'] + "\n" + data['date'], appointments: appoint));
    }

    String clickedValue =
        Provider.of<CalendarData>(context, listen: true).testing;
    return Scaffold(
      key: _drawerKey,
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       DrawerHeader(
      //         child: Text('Drawer Header'),
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //       ),
      //       ListTile(
      //         title: Text('Item 1'),
      //         onTap: () {},
      //       ),
      //       ListTile(
      //         title: Text(clickedValue),
      //         onTap: () {
      //           Provider.of<CalendarData>(context, listen: false).setText(
      //               "Clicked inside drawer that's being displayed for $clickedValue");
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      appBar: AppBar(
        title: Text(widget.title),
      ),

      // ListView.builder(
      //           scrollDirection: Axis.vertical,
      //           itemCount: childrenAdded.length,
      //           itemBuilder: (BuildContext context, int index) {
      //             return childrenAdded[index];
      //           })

      // body: Container(
      //   height: 1000,
      //   child: ListView(
      //     shrinkWrap: true,
      //     children: [
      //       ListView.builder(
      //         scrollDirection: Axis.horizontal,
      //         itemCount: testArray.length,
      //         itemBuilder: (BuildContext context, int index) {
      //           return
      //               // Container(width: 230, child: TestTimeTable()),
      //               createAppointmentFromArray(testArray[index]);

      //           //);
      //         },
      //       ),
      //     ],
      //   ),
      // )

      body: ListView(
        shrinkWrap: true,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(width: 230, child: TestTimeTable()),
                ...createAppointmentsFromArray(testArray),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

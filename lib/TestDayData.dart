import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'DropDown.dart';
import 'provider/CalendarData.dart';

class TestDayData extends StatelessWidget {
  final List<String> timesList = [
    "06:00",
    "07:00",
    "08:00",
    "09:00",
    "10:00",
    "11:00",
    "12:00",
    "13:00",
    "14:00",
    "15:00",
    "16:00",
    "17:00",
    "18:00",
    "19:00",
    "20:00"
  ];

  final String day;

  TestDayData({Key key, this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(
        "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!TestDayData rebuild: key: $key !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    return DataTable(
      // showCheckboxColumn: false,
      columns: [
        DataColumn(
          label: Center(child: Text(day, textAlign: TextAlign.center)),
          numeric: false,
        ),
      ],
      rows: timesList
          .map(
            (times) => DataRow(cells: [
              DataCell(
                Text(""),
                onTap: () {
                  String selectedValue;
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Form(
                          // key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(day.toString() + " - " + times.toString()),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.person),
                                    hintText: 'This is just filler text?',
                                    labelText: 'testing *',
                                  ),
                                ),
                              ),
                              DropDown(onSelected: (String val) {
                                print('newValue: $val');
                                selectedValue = val;
                              }),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RaisedButton(
                                  child: Text('Create appointment'),
                                  onPressed: () {
                                    Provider.of<CalendarData>(context,
                                            listen: false)
                                        .makeAppointmentCheat(
                                            date: day.split("\n")[1],
                                            time: times,
                                            duration: 4,
                                            name: "Place #203",
                                            color: (selectedValue != null)
                                                ? selectedValue.toLowerCase()
                                                : "purple");
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                //},
              ),
            ]),
          )
          .toList(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gcfd/CreateForm.dart';
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
                          content: CreateForm(day: day, times: times));
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

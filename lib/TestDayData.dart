import 'package:flutter/material.dart';

class TestDayData extends StatelessWidget {
  final List<String> timesList = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  final String day;

  TestDayData({Key key, this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DataTable(
        showCheckboxColumn: false,
        columns: [
          DataColumn(
            label: Center(child: Text(day)),
            numeric: false,
          ),
        ],
        rows: timesList
            .map(
              (times) => DataRow(cells: [
                DataCell(
                  Text(times.toString()),
                ),
              ]),
            )
            .toList(),
      ),
    );
  }
}

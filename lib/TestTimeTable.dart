import 'package:flutter/material.dart';

class TestTimeTable extends StatelessWidget {
  TestTimeTable({Key key}) : super(key: key);
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DataTable(
        showCheckboxColumn: false,
        columns: [
          DataColumn(
            label: Text(" "),
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

import 'package:flutter/material.dart';

class TestDataTable extends StatelessWidget {
  TestDataTable({Key key}) : super(key: key);
  final List<String> timesList = ["06:00", "07:00", "08:00", "09:00", "10:00"];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DataTable(
        showCheckboxColumn: false,
        sortColumnIndex: 0,
        columns: [
          DataColumn(
            label: Text(""),
            numeric: false,
          ),
        ],
        rows: timesList
            .map(
              (times) => DataRow(cells: [
                DataCell(
                  Text(times.toString()),
                ),
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

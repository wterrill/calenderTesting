import 'package:flutter/material.dart';
import 'ScheduleData.dart';

class ScheduleDataTable extends StatefulWidget {
  final Function(String) selectRowCallback;
  ScheduleDataTable({this.selectRowCallback});
  @override
  _ScheduleDataTableState createState() => _ScheduleDataTableState();
}

class _ScheduleDataTableState extends State<ScheduleDataTable> {
  List<ScheduleData> ScheduleDataList;
  ScheduleData selectedData;

  @override
  void initState() {
    ScheduleDataList = ScheduleData.getScheduleData();
    super.initState();
  }

  void onSelectedRow(ScheduleData data) {
    widget.selectRowCallback(data.time.toString());
  }

  SingleChildScrollView dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        // showCheckboxColumn: false,
        // sortColumnIndex: 1,
        columns: [
          DataColumn(
            label: Text("BEATS"),
            numeric: false,
          ),
          DataColumn(
            label: Text("DESCRIPTION"),
            numeric: false,
          ),
        ],
        rows: ScheduleDataList.map(
          (data) => DataRow(
              selected: selectedData == data,
              onSelectChanged: (b) {
                onSelectedRow(data);
              },
              cells: [
                DataCell(
                  Text(data.beats.toString()),
                ),
                DataCell(
                  Text(data.desc.toString()),
                ),
              ]),
        ).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      verticalDirection: VerticalDirection.down,
      children: <Widget>[
        dataBody(),
      ],
    );
  }
}

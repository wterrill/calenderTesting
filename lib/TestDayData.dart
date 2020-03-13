import 'package:flutter/material.dart';

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
      showCheckboxColumn: false,
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
                                    hintText: 'What do people call you?',
                                    labelText: 'Name *',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RaisedButton(
                                  child: Text("Create appointment"),
                                  onPressed: () {
                                    // if (_formKey.currentState.validate()) {
                                    //   _formKey.currentState.save();
                                    // }
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

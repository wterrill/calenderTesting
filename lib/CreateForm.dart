import 'package:flutter/material.dart';
import 'package:gcfd/DropDown.dart';
import 'package:gcfd/provider/CalendarData.dart';
import 'package:provider/provider.dart';

class CreateForm extends StatefulWidget {
  final day;
  final times;

  CreateForm({Key key, this.day, this.times}) : super(key: key);

  @override
  _CreateFormState createState() => _CreateFormState();
}

class _CreateFormState extends State<CreateForm> {
  final _placeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var selectedColor;
    var selectedDuration;
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(widget.day.toString() + " - " + widget.times.toString()),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _placeController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Ex: Place #7',
                labelText: 'Site Name',
              ),
            ),
          ),
          DropDown(
              onSelected: (String val) {
                selectedDuration = val;
                print("val: $val");
                print("selectedColor: $selectedColor");
              },
              selectionList: [
                '0.5',
                '1.0',
                '1.5',
                '2.0',
                '2.5',
                '3.0',
                '3.5',
                '4.0',
                '4.5',
                '5.0',
              ],
              initialSelection: "2.0"),
          DropDown(
              onSelected: (String val) {
                selectedColor = val;
                print("val: $val");
                print("selectedDuration: $selectedDuration");
              },
              selectionList: ['Purple', 'Yellow', 'Green', 'Orange'],
              initialSelection: "Purple"),
          // Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: TextFormField(),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              child: Text('Create appointment'),
              onPressed: () {
                Provider.of<CalendarData>(context, listen: false)
                    .makeAppointmentCheat(
                        date: widget.day.split("\n")[1],
                        time: widget.times,
                        duration: selectedDuration,
                        name: _placeController.text,
                        color: (selectedColor != null)
                            ? selectedColor.toLowerCase()
                            : "purple");
                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
          )
        ],
      ),
    );
  }
}

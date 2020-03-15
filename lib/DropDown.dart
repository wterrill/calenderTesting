import 'package:flutter/material.dart';
import 'ColorDef.dart';

class DropDown extends StatefulWidget {
  final Function(String) onSelected;
  final List<String> selectionList;
  final String initialSelection;
  DropDown(
      {Key key, this.onSelected, this.selectionList, this.initialSelection})
      : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String dropdownValue = '';
  List<String> selectionList = [];

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.initialSelection;
    selectionList = widget.selectionList;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        widget.onSelected(newValue);
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: selectionList.map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,
              style: TextStyle(
                color: ColorDef.colors[value.toLowerCase()],
              )),
        );
      }).toList(),
    );
  }
}

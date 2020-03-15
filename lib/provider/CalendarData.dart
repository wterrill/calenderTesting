import 'package:flutter/material.dart';
// import 'package:Catalogo/src/utilities/API.dart';
// import 'dart:convert';
// import 'package:Catalogo/src/utilities/readWrite.dart';

// import 'dart:io';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:path_provider/path_provider.dart';

// import 'package:http/http.dart' show get;
import 'dart:async';
// import 'package:package_info/package_info.dart';
// import 'package:intl/intl.dart';

class CalendarData with ChangeNotifier {
  String testing = "Data Provider works";

  var testArray = [
    {
      'DOW': 'Monday',
      'date': '03-09-2020',
      'appointments': [
        {'start': 2, 'color': 'purple', 'duration': 3, 'text': 'Place #1'},
        {'start': 8, 'color': 'yellow', 'duration': 5, 'text': 'Place #2'},
        {'start': 15, 'color': 'green', 'duration': 7, 'text': 'Place #3'},
      ]
    },
    {
      'DOW': 'Tuesday',
      'date': '03-10-2020',
      'appointments': [
        {'start': 2, 'color': 'purple', 'duration': 3, 'text': 'Place #4'},
        // {'start': 8, 'color': 'yellow', 'duration': 4, 'text': 'Place #5'},
        {'start': 15, 'color': 'green', 'duration': 3, 'text': 'Place #6'},
      ]
    },
    {
      'DOW': 'Wednesday',
      'date': '03-11-2020',
      'appointments': [
        // {'start': 2, 'color': 'purple', 'duration': 3, 'text': 'Place #7'},
        // {'start': 8, 'color': 'yellow', 'duration': 4, 'text': 'Place #8'},
        // {'start': 15, 'color': 'green', 'duration': 3, 'text': 'Place #9'},
      ]
    },
    {
      'DOW': 'Thursday',
      'date': '03-12-2020',
      'appointments': [
        {'start': 2, 'color': 'purple', 'duration': 3, 'text': 'Place #10'},
        {'start': 8, 'color': 'yellow', 'duration': 4, 'text': 'Place #11'},
        // {'start': 15, 'color': 'green', 'duration': 3, 'text': 'Place #12'},
      ]
    },
    {
      'DOW': 'Friday',
      'date': '03-13-2020',
      'appointments': [
        // {'start': 2, 'color': 'purple', 'duration': 3, 'text': 'Place #13'},
        {'start': 8, 'color': 'yellow', 'duration': 4, 'text': 'Place #14'},
        {'start': 15, 'color': 'green', 'duration': 3, 'text': 'Place #15'},
      ]
    },
    {'DOW': 'Saturday', 'date': '03-14-2020', 'appointments': []},
    {'DOW': 'Sunday', 'date': '03-15-2020', 'appointments': []},
    {
      'DOW': 'Monday',
      'date': '03-16-2020',
      'appointments': [
        {'start': 2, 'color': 'purple', 'duration': 3, 'text': 'Place #1'},
        {'start': 8, 'color': 'yellow', 'duration': 5, 'text': 'Place #2'},
        {'start': 15, 'color': 'green', 'duration': 7, 'text': 'Place #3'},
      ]
    },
    {
      'DOW': 'Tuesday',
      'date': '03-17-2020',
      'appointments': [
        {'start': 2, 'color': 'purple', 'duration': 3, 'text': 'Place #4'},
        // {'start': 8, 'color': 'yellow', 'duration': 4, 'text': 'Place #5'},
        {'start': 15, 'color': 'green', 'duration': 3, 'text': 'Place #6'},
      ]
    },
    {
      'DOW': 'Wednesday',
      'date': '03-18-2020',
      'appointments': [
        // {'start': 2, 'color': 'purple', 'duration': 3, 'text': 'Place #7'},
        // {'start': 8, 'color': 'yellow', 'duration': 4, 'text': 'Place #8'},
        // {'start': 15, 'color': 'green', 'duration': 3, 'text': 'Place #9'},
      ]
    },
    {
      'DOW': 'Thursday',
      'date': '03-19-2020',
      'appointments': [
        {'start': 2, 'color': 'purple', 'duration': 3, 'text': 'Place #10'},
        {'start': 8, 'color': 'yellow', 'duration': 4, 'text': 'Place #11'},
        // {'start': 15, 'color': 'green', 'duration': 3, 'text': 'Place #12'},
      ]
    },
    {
      'DOW': 'Friday',
      'date': '03-20-2020',
      'appointments': [
        // {'start': 2, 'color': 'purple', 'duration': 3, 'text': 'Place #13'},
        {'start': 8, 'color': 'yellow', 'duration': 4, 'text': 'Place #14'},
        {'start': 15, 'color': 'green', 'duration': 3, 'text': 'Place #15'},
      ]
    },
    {'DOW': 'Saturday', 'date': '03-21-2020', 'appointments': []},
    {'DOW': 'Sunday', 'date': '03-22-2020', 'appointments': []},
  ];

  CalendarData() {
    initializeApp();
  }

  initializeApp() {
    print("initialized CalendarData Provider");
    testing = "";
  }

  void setText(String text) {
    testing = text;
    notifyListeners();
  }

  // void makeAppointment({String date, Map apptData }){

  // }

  void makeAppointmentCheat(
      {String date, String time, int duration, String name, String color}) {
    print("day:$date, time:$time, duration:$duration");
    int index = getIndexFromDay(date);
    print(index);
    List appt = testArray[index]['appointments'];
    int startTime = convertTime(time);
    print(startTime);
    //appt.length - 1
    appt.insert(0, {
      'start': startTime,
      'color': color,
      'duration': duration,
      'text': name,
    });
    testArray[index]['appointments'] = appt;
    notifyListeners();
  }

  int getIndexFromDay(String date) {
    int index =
        testArray.indexWhere((dateString) => dateString['date'] == date);
    return index;
  }

  int convertTime(String time) {
    List<String> splitTime = time.split(":");
    print("splitTime=$splitTime");
    int startStep = ((int.parse(splitTime[0]) - 6) * 2);
    print(startStep);
    return startStep;
  }
}

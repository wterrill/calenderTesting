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
      'title': 'Monday\n03-09-2020',
      'appointments': [
        {'start': 2, 'color': 'purple', 'duration': 3, 'text': 'Place #1'},
        {'start': 8, 'color': 'yellow', 'duration': 5, 'text': 'Place #2'},
        {'start': 15, 'color': 'green', 'duration': 7, 'text': 'Place #3'},
      ]
    },
    {
      'title': 'Tuesday\n03-10-2020',
      'appointments': [
        {'start': 2, 'color': 'purple', 'duration': 3, 'text': 'Place #4'},
        // {'start': 8, 'color': 'yellow', 'duration': 4, 'text': 'Place #5'},
        {'start': 15, 'color': 'green', 'duration': 3, 'text': 'Place #6'},
      ]
    },
    {
      'title': 'Wednesday\n03-11-2020',
      'appointments': [
        // {'start': 2, 'color': 'purple', 'duration': 3, 'text': 'Place #7'},
        // {'start': 8, 'color': 'yellow', 'duration': 4, 'text': 'Place #8'},
        // {'start': 15, 'color': 'green', 'duration': 3, 'text': 'Place #9'},
      ]
    },
    {
      'title': 'Thursday\n03-12-2020',
      'appointments': [
        {'start': 2, 'color': 'purple', 'duration': 3, 'text': 'Place #10'},
        {'start': 8, 'color': 'yellow', 'duration': 4, 'text': 'Place #11'},
        // {'start': 15, 'color': 'green', 'duration': 3, 'text': 'Place #12'},
      ]
    },
    {
      'title': 'Friday\n03-13-2020',
      'appointments': [
        // {'start': 2, 'color': 'purple', 'duration': 3, 'text': 'Place #13'},
        {'start': 8, 'color': 'yellow', 'duration': 4, 'text': 'Place #14'},
        {'start': 15, 'color': 'green', 'duration': 3, 'text': 'Place #15'},
      ]
    },
    {
      'title': 'Saturday\n03-14-2020',
      'appointments': [
        {'start': 2, 'color': 'purple', 'duration': 3, 'text': 'Place #16'},
        {'start': 8, 'color': 'yellow', 'duration': 4, 'text': 'Place #17'},
        {'start': 15, 'color': 'green', 'duration': 3, 'text': 'Place #18'},
      ]
    }
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

  void makeAppointmentCheat({int index}) {
    //Map apptData
    List appt = testArray[index]['appointments'];
    appt.insert(1,
        {'start': 24, 'color': 'orange', 'duration': 3, 'text': 'Place #101'});
    testArray[index]['appointments'] = appt;
    notifyListeners();
  }
}

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
}

import 'package:intl/intl.dart';

beer() {
  List<Map<String, Object>> testArray = [
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

  DateTime now = DateTime.now();
  DateTime start = now.add(Duration(days: -30));
  DateTime end = now.add(Duration(days: 31));
  Duration dayDifference = end.difference(start);

  List<DateTime> datetimes = List.generate(
      dayDifference.inDays, (index) => start.add(Duration(days: index)));

  List<Map> appointmentsList = [];
  datetimes.forEach((element) {
    String dayName = DateFormat('EEEEE').format(element);
    String date = DateFormat('MM-dd-yyyy').format(element);
    // https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html

    Map<String, Object> dayObj = {
      'DOW': dayName,
      'date': date,
      'appointments': []
    };
    appointmentsList.add(dayObj);
  });
  print(appointmentsList);

  testArray.forEach((element) {
    int index = appointmentsList
        .indexWhere((appointment) => appointment['date'] == element['date']);
    appointmentsList.removeAt(index);
    appointmentsList.insert(index, element);
  });
  print("------------------------");
  appointmentsList.forEach((element) {
    print(element['date']);
  });
}

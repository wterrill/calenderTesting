class ScheduleData {
  int num;
  String beats;
  String desc;
  Duration time;

  ScheduleData({this.num, this.beats, this.desc, this.time});

  static List<ScheduleData> getScheduleData() {
    return <ScheduleData>[
      ScheduleData(beats: "1 2 3", desc: "Basic", time: Duration.zero),
      ScheduleData(
          beats: "5 6 7", desc: "Cross body turn", time: Duration(seconds: 2)),
      ScheduleData(beats: "1 2 3", desc: "Basic", time: Duration(seconds: 4)),
      ScheduleData(
          beats: "5 6 7",
          desc: "Cross body to open basic",
          time: Duration(seconds: 6)),
      ScheduleData(beats: "1 2 3", desc: "Basic", time: Duration.zero),
      ScheduleData(
          beats: "5 6 7", desc: "Cross body turn", time: Duration(seconds: 2)),
      ScheduleData(beats: "1 2 3", desc: "Basic", time: Duration(seconds: 4)),
      ScheduleData(
          beats: "5 6 7",
          desc: "Cross body to open basic",
          time: Duration(seconds: 6)),
      ScheduleData(num: 1, beats: "1 2 3", desc: "Basic", time: Duration.zero),
      ScheduleData(
          beats: "5 6 7", desc: "Cross body turn", time: Duration(seconds: 2)),
      ScheduleData(beats: "1 2 3", desc: "Basic", time: Duration(seconds: 4)),
      ScheduleData(
          beats: "5 6 7",
          desc: "Cross body to open basic",
          time: Duration(seconds: 6)),
      ScheduleData(beats: "1 2 3", desc: "Basic", time: Duration.zero),
      ScheduleData(
          beats: "5 6 7", desc: "Cross body turn", time: Duration(seconds: 2)),
      ScheduleData(beats: "1 2 3", desc: "Basic", time: Duration(seconds: 4)),
      ScheduleData(
          beats: "5 6 7",
          desc: "Cross body to open basic",
          time: Duration(seconds: 6)),
    ];
  }
}

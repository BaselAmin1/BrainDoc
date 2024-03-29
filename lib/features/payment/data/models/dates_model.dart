class DatesModel {
  String? weakDay;
  List<DatesTime>? datetime;

  DatesModel({this.weakDay, this.datetime});

  factory DatesModel.fromJson(Map<String, dynamic> json) {
    return DatesModel(
      weakDay: json['weakDay'],
      datetime: json['datetime'] != null
          ? (json['datetime'] as List)
              .map((e) => DatesTime.fromJson(e))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'weakDay': weakDay,
      'datetime': datetime?.map((date) => date.toJson()).toList(),
    };
  }
}

class DatesTime {
  String? time;
  List<TimeBokked>? timeBokked;

  DatesTime({this.time, this.timeBokked});

  factory DatesTime.fromJson(Map<String, dynamic> json) {
    return DatesTime(
      time: json['time'],
      timeBokked: json['timeBokked'] != null
          ? (json['timeBokked'] as List)
              .map((e) => TimeBokked.fromJson(e))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'timeBokked':
          timeBokked?.map((timeBokked) => timeBokked.toJson()).toList(),
    };
  }
}

class TimeBokked {
  String? time;

  TimeBokked({this.time});

  factory TimeBokked.fromJson(Map<String, dynamic> json) {
    return TimeBokked(
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
    };
  }
}

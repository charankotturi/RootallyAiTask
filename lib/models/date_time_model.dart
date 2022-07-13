import 'dart:convert';

class DateTimeModel {
  String date;
  String time;
  DateTimeModel({
    required this.date,
    required this.time,
  });

  DateTimeModel copyWith({
    String? date,
    String? time,
  }) {
    return DateTimeModel(
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'time': time,
    };
  }

  factory DateTimeModel.fromMap(Map<String, dynamic> map) {
    return DateTimeModel(
      date: map['date'] ?? '',
      time: map['time'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DateTimeModel.fromJson(String source) =>
      DateTimeModel.fromMap(json.decode(source));

  @override
  String toString() => 'DateTimeModel(date: $date, time: $time)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DateTimeModel && other.date == date && other.time == time;
  }

  @override
  int get hashCode => date.hashCode ^ time.hashCode;
}

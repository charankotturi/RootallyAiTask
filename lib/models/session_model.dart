import 'dart:convert';

class SessionModel {
  String time;
  String position;

  SessionModel({
    required this.time,
    required this.position,
  });

  SessionModel copyWith({
    String? time,
    String? position,
  }) {
    return SessionModel(
      time: time ?? this.time,
      position: position ?? this.position,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'time': time,
      'position': position,
    };
  }

  factory SessionModel.fromMap(Map<String, dynamic> map) {
    return SessionModel(
      time: map['time'] ?? '',
      position: map['position'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SessionModel.fromJson(String source) =>
      SessionModel.fromMap(json.decode(source));

  @override
  String toString() => 'SessionModel(time: $time, position: $position)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SessionModel &&
        other.time == time &&
        other.position == position;
  }

  @override
  int get hashCode => time.hashCode ^ position.hashCode;
}

Map<dynamic, dynamic> convertTempListToMap(List<Temp> temps) {
  Map<dynamic, dynamic> map = {};
  for (var i = 0; i < temps.length; i++) {
    map.addAll({'$i': temps[i].toJson()});
  }
  return map;
}

List<Temp> convertMapToTempList(Map<dynamic, dynamic> map) {
  List<Temp> reviews = [];
  for (var i = 0; i < map.length; i++) {
    reviews.add(Temp.fromJson(map['$i']));
  }
  return reviews;
}

class Temp {
  final String stylename;
  final String salonname;

  bool done;
  final DateTime created;

  Temp({
    required this.stylename,
    required this.salonname,
    this.done = false,
    required this.created,
  });

  Map<String, Object?> toJson() => {
        'stylename': stylename,
        'salonname': salonname,
        'done': done ? 1 : 0,
        'created': created.millisecondsSinceEpoch,
      };

  static Temp fromJson(Map<dynamic, dynamic>? json) => Temp(
        stylename: json!['stylename'] as String,
        salonname: json['salonname'] as String,
        done: json['done'] == 1 ? true : false,
        created: DateTime.fromMillisecondsSinceEpoch(
            (json['created'] as double).toInt()),
      );

  @override
  bool operator ==(covariant Temp temp) {
    return (this
                .stylename
                .toUpperCase()
                .compareTo(temp.stylename.toUpperCase()) ==
            0 &&
        this.salonname.toUpperCase().compareTo(temp.salonname.toUpperCase()) ==
            0);
  }

  @override
  int get hashCode {
    return stylename.hashCode + salonname.hashCode;
  }
}

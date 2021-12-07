Map<dynamic, dynamic> convertFavouriteListToMap(List<Favourite> favourites) {
  Map<dynamic, dynamic> map = {};
  for (var i = 0; i < favourites.length; i++) {
    map.addAll({'$i': favourites[i].toJson()});
  }
  return map;
}

List<Favourite> convertMapToFavouriteList(Map<dynamic, dynamic> map) {
  List<Favourite> favourites = [];
  for (var i = 0; i < map.length; i++) {
    favourites.add(Favourite.fromJson(map['$i']));
  }
  return favourites;
}

class Favourite {
  final String stylename;

  final String salonadress;

  bool done;
  final DateTime created;

  Favourite({
    required this.stylename,
    required this.salonadress,
    this.done = false,
    required this.created,
  });

  Map<String, Object?> toJson() => {
        'stylename': stylename,
        'bookingnumber': salonadress,
        'done': done ? 1 : 0,
        'created': created.millisecondsSinceEpoch,
      };

  static Favourite fromJson(Map<dynamic, dynamic>? json) => Favourite(
        stylename: json!['stylename'] as String,
        salonadress: json['salonadress'] as String,
        done: json['done'] == 1 ? true : false,
        created: DateTime.fromMillisecondsSinceEpoch(
            (json['created'] as double).toInt()),
      );

  @override
  bool operator ==(covariant Favourite favourite) {
    return (this
                .stylename
                .toUpperCase()
                .compareTo(favourite.stylename.toUpperCase()) ==
            0 &&
        this
                .salonadress
                .toUpperCase()
                .compareTo(favourite.salonadress.toUpperCase()) ==
            0);
  }

  @override
  int get hashCode {
    return stylename.hashCode + salonadress.hashCode;
  }
}

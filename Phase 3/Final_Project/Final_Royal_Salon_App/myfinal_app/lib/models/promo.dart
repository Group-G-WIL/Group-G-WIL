Map<dynamic, dynamic> convertPromoListToMap(List<Promo> promos) {
  Map<dynamic, dynamic> map = {};
  for (var i = 0; i < promos.length; i++) {
    map.addAll({'$i': promos[i].toJson()});
  }
  return map;
}

List<Promo> convertMapToPromoList(Map<dynamic, dynamic> map) {
  List<Promo> promos = [];
  for (var i = 0; i < map.length; i++) {
    promos.add(Promo.fromJson(map['$i']));
  }
  return promos;
}

class Promo {
  final String stylename;
  final String discount;
  final String lastday;

  bool done;
  final DateTime created;

  Promo({
    required this.stylename,
    required this.discount,
    required this.lastday,
    this.done = false,
    required this.created,
  });

  Map<String, Object?> toJson() => {
        'stylename': stylename,
        'discount': discount,
        'lastday': lastday,
        'done': done ? 1 : 0,
        'created': created.millisecondsSinceEpoch,
      };

  static Promo fromJson(Map<dynamic, dynamic>? json) => Promo(
        stylename: json!['stylename'] as String,
        discount: json['discount'] as String,
        lastday: json['lastday'] as String,
        done: json['done'] == 1 ? true : false,
        created: DateTime.fromMillisecondsSinceEpoch(
            (json['created'] as double).toInt()),
      );

  @override
  bool operator ==(covariant Promo promo) {
    return (this
                .stylename
                .toUpperCase()
                .compareTo(promo.stylename.toUpperCase()) ==
            0 &&
        this.discount.toUpperCase().compareTo(promo.discount.toUpperCase()) ==
            0 &&
        this.lastday.toUpperCase().compareTo(promo.lastday.toUpperCase()) == 0);
  }

  @override
  int get hashCode {
    return stylename.hashCode + discount.hashCode + lastday.hashCode;
  }
}

class SalonEntry {
  Map<dynamic, dynamic> salons;
  String username;
  String? objectId;
  DateTime? created;
  DateTime? updated;

  SalonEntry({
    required this.salons,
    required this.username,
    this.objectId,
    this.created,
    this.updated,
  });

  Map<String, Object?> toJson() => {
        'username': username,
        'salons': salons,
        'created': created,
        'updated': updated,
        'objectId': objectId,
      };

  static SalonEntry fromJson(Map<dynamic, dynamic>? json) => SalonEntry(
        username: json!['username'] as String,
        salons: json['salons'] as Map<dynamic, dynamic>,
        objectId: json['objectId'] as String,
        created: json['created'] as DateTime,
      );
}

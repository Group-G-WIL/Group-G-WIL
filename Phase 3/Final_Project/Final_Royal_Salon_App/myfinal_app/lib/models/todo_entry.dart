class TodoEntry {
  Map<dynamic, dynamic> todos;
  Map<dynamic, dynamic> promos;
  String username;
  String? objectId;
  DateTime? created;
  DateTime? updated;

  TodoEntry({
    required this.todos,
    required this.promos,
    required this.username,
    this.objectId,
    this.created,
    this.updated,
  });

  Map<String, Object?> toJson() => {
        'username': username,
        'todos': todos,
        'promos': promos,
        'created': created,
        'updated': updated,
        'objectId': objectId,
      };

  static TodoEntry fromJson(Map<dynamic, dynamic>? json) => TodoEntry(
        username: json!['username'] as String,
        todos: json['todos'] as Map<dynamic, dynamic>,
        promos: json['promos'] as Map<dynamic, dynamic>,
        objectId: json['objectId'] as String,
        created: json['created'] as DateTime,
      );
}

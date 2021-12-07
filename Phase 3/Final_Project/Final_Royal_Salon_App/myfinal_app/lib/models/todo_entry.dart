class TodoEntry {
  Map<dynamic, dynamic> todos;
  Map<dynamic, dynamic> promos;
  Map<dynamic, dynamic> invoices;
  Map<dynamic, dynamic> reviews;
  Map<dynamic, dynamic> favourites;
  Map<dynamic, dynamic> comments;
  Map<dynamic, dynamic> temps;
  String username;
  String? objectId;
  DateTime? created;
  DateTime? updated;

  TodoEntry({
    required this.todos,
    required this.promos,
    required this.invoices,
    required this.username,
    required this.comments,
    required this.favourites,
    required this.reviews,
    required this.temps,
    this.objectId,
    this.created,
    this.updated,
  });

  Map<String, Object?> toJson() => {
        'username': username,
        'todos': todos,
        'promos': promos,
        'invoices': invoices,
        'favourites': favourites,
        'comments': comments,
        'reviews': reviews,
        'temps': temps,
        'created': created,
        'updated': updated,
        'objectId': objectId,
      };

  static TodoEntry fromJson(Map<dynamic, dynamic>? json) => TodoEntry(
        username: json!['username'] as String,
        todos: json['todos'] as Map<dynamic, dynamic>,
        promos: json['promos'] as Map<dynamic, dynamic>,
        invoices: json['invoices'] as Map<dynamic, dynamic>,
        comments: json['comments'] as Map<dynamic, dynamic>,
        temps: json['temps'] as Map<dynamic, dynamic>,
        reviews: json['reviews'] as Map<dynamic, dynamic>,
        favourites: json['favourites'] as Map<dynamic, dynamic>,
        objectId: json['objectId'] as String,
        created: json['created'] as DateTime,
      );
}

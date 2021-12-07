Map<dynamic, dynamic> convertCommentListToMap(List<Comment> comments) {
  Map<dynamic, dynamic> map = {};
  for (var i = 0; i < comments.length; i++) {
    map.addAll({'$i': comments[i].toJson()});
  }
  return map;
}

List<Comment> convertMapToCommentList(Map<dynamic, dynamic> map) {
  List<Comment> comments = [];
  for (var i = 0; i < map.length; i++) {
    comments.add(Comment.fromJson(map['$i']));
  }
  return comments;
}

class Comment {
  final String stylename;

  final String rate1;
  final String rate2;
  final String comment1;

  bool done;
  final DateTime created;

  Comment({
    required this.stylename,
    required this.comment1,
    required this.rate1,
    required this.rate2,
    this.done = false,
    required this.created,
  });

  Map<String, Object?> toJson() => {
        'stylename': stylename,
        'comment': comment1,
        'rate2': rate2,
        'rate1': rate1,
        'done': done ? 1 : 0,
        'created': created.millisecondsSinceEpoch,
      };

  static Comment fromJson(Map<dynamic, dynamic>? json) => Comment(
        stylename: json!['stylename'] as String,
        comment1: json['comment1'] as String,
        rate1: json['rate1'] as String,
        rate2: json['rate2'] as String,
        done: json['done'] == 1 ? true : false,
        created: DateTime.fromMillisecondsSinceEpoch(
            (json['created'] as double).toInt()),
      );

  @override
  bool operator ==(covariant Comment comment) {
    return (this
                .stylename
                .toUpperCase()
                .compareTo(comment.stylename.toUpperCase()) ==
            0 &&
        this.rate1.toUpperCase().compareTo(comment.rate1.toUpperCase()) == 0 &&
        this.rate2.toUpperCase().compareTo(comment.rate2.toUpperCase()) == 0 &&
        this.comment1.toUpperCase().compareTo(comment.comment1.toUpperCase()) ==
            0);
  }

  @override
  int get hashCode {
    return stylename.hashCode +
        comment1.hashCode +
        rate1.hashCode +
        rate2.hashCode;
  }
}

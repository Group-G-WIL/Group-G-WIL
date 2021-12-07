Map<dynamic, dynamic> convertReviewListToMap(List<Review> reviews) {
  Map<dynamic, dynamic> map = {};
  for (var i = 0; i < reviews.length; i++) {
    map.addAll({'$i': reviews[i].toJson()});
  }
  return map;
}

List<Review> convertMapToReviewList(Map<dynamic, dynamic> map) {
  List<Review> reviews = [];
  for (var i = 0; i < map.length; i++) {
    reviews.add(Review.fromJson(map['$i']));
  }
  return reviews;
}

class Review {
  final String stylename;
  final String salonname;
  final String rate1;
  final String rate2;
  final String comment;

  bool done;
  final DateTime created;

  Review({
    required this.stylename,
    required this.salonname,
    required this.comment,
    required this.rate1,
    required this.rate2,
    this.done = false,
    required this.created,
  });

  Map<String, Object?> toJson() => {
        'stylename': stylename,
        'salonname': salonname,
        'comment': comment,
        'rate2': rate2,
        'rate1': rate1,
        'done': done ? 1 : 0,
        'created': created.millisecondsSinceEpoch,
      };

  static Review fromJson(Map<dynamic, dynamic>? json) => Review(
        stylename: json!['stylename'] as String,
        salonname: json['salonname'] as String,
        comment: json['comment'] as String,
        rate1: json['rate1'] as String,
        rate2: json['rate2'] as String,
        done: json['done'] == 1 ? true : false,
        created: DateTime.fromMillisecondsSinceEpoch(
            (json['created'] as double).toInt()),
      );

  @override
  bool operator ==(covariant Review review) {
    return (this
                .stylename
                .toUpperCase()
                .compareTo(review.stylename.toUpperCase()) ==
            0 &&
        this
                .salonname
                .toUpperCase()
                .compareTo(review.salonname.toUpperCase()) ==
            0 &&
        this.rate1.toUpperCase().compareTo(review.rate1.toUpperCase()) == 0 &&
        this.rate2.toUpperCase().compareTo(review.rate2.toUpperCase()) == 0 &&
        this.comment.toUpperCase().compareTo(review.comment.toUpperCase()) ==
            0);
  }

  @override
  int get hashCode {
    return stylename.hashCode +
        comment.hashCode +
        rate1.hashCode +
        rate2.hashCode +
        salonname.hashCode;
  }
}

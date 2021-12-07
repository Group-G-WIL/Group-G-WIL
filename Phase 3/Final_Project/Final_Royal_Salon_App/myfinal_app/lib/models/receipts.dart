Map<dynamic, dynamic> convertinvoicesListToMap(List<Invoice> invoices) {
  Map<dynamic, dynamic> map = {};
  for (var i = 0; i < invoices.length; i++) {
    map.addAll({'$i': invoices[i].toJson()});
  }
  return map;
}

List<Invoice> convertMapToinvoicesList(Map<dynamic, dynamic> map) {
  List<Invoice> invoices = [];
  for (var i = 0; i < map.length; i++) {
    invoices.add(Invoice.fromJson(map['$i']));
  }
  return invoices;
}

class Invoice {
  final String stylename;

  final String price;
  final String bookingnumber;
  final String date;
  final String time;

  bool done;
  final DateTime created;

  Invoice({
    required this.stylename,
    required this.bookingnumber,
    required this.date,
    required this.time,
    required this.price,
    this.done = false,
    required this.created,
  });

  Map<String, Object?> toJson() => {
        'stylename': stylename,
        'bookingnumber': bookingnumber,
        'date': date,
        'time': time,
        'price': price,
        'done': done ? 1 : 0,
        'created': created.millisecondsSinceEpoch,
      };

  static Invoice fromJson(Map<dynamic, dynamic>? json) => Invoice(
        stylename: json!['stylename'] as String,
        bookingnumber: json['bookingnumber'] as String,
        date: json['date'] as String,
        time: json['time'] as String,
        price: json['price'] as String,
        done: json['done'] == 1 ? true : false,
        created: DateTime.fromMillisecondsSinceEpoch(
            (json['created'] as double).toInt()),
      );

  @override
  bool operator ==(covariant Invoice invoice) {
    return (this
                .stylename
                .toUpperCase()
                .compareTo(invoice.stylename.toUpperCase()) ==
            0 &&
        this
                .bookingnumber
                .toUpperCase()
                .compareTo(invoice.bookingnumber.toUpperCase()) ==
            0 &&
        this.price.toUpperCase().compareTo(invoice.price.toUpperCase()) == 0 &&
        this.date.toUpperCase().compareTo(invoice.date.toUpperCase()) == 0 &&
        this.time.toUpperCase().compareTo(invoice.time.toUpperCase()) == 0);
  }

  @override
  int get hashCode {
    return stylename.hashCode +
        date.hashCode +
        price.hashCode +
        time.hashCode +
        bookingnumber.hashCode;
  }
}

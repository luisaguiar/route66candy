class Order {
  final BigInt id;
  final String user_id;
  final DateTime date;
  final String status;

  Order(
      {required this.id,
      required this.user_id,
      required this.date,
      required this.status});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      user_id: json['user_id'],
      date: json['date'],
      status: json['status'],
    );
  }
}

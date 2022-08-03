class Membership {
  final int id;
  final DateTime start_date;
  final DateTime end_date;
  final String status;
  final String level;

  Membership(
      {required this.id,
      required this.start_date,
      required this.end_date,
      required this.status,
      required this.level});
}

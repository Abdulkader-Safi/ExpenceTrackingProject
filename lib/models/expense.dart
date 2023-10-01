import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Expense {
  final String id;
  final String title;
  final String amount;
  final DateTime date;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
  }) : id = uuid.v4();
}

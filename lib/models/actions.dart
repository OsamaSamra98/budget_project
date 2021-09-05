import 'package:budget_planner_project/models/db_table.dart';

class Operation extends DbTable{
  static const TABLE_NAME = 'actions';
  late int id;
  late int amount;
  late DateTime date;
  late bool expense;
  late String notes;
  late int userId;
  late int categoryId;
  late int currencyId;

  Operation();

  Operation.fromMap(Map<String, dynamic> rowMap) : super.fromMap(rowMap) {
    id = rowMap['id'];
    amount = rowMap['amount'];
    date = DateTime.parse(rowMap['date']);
    expense = rowMap['expense'] == 1;
    notes = rowMap['notes'];
    userId = rowMap['user_id'];
    categoryId = rowMap['category_id'];
    currencyId = rowMap['currency_id'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['amount'] = amount;
    map['date'] = date.toIso8601String();
    map['expense'] = expense ? 1 : 0;
    map['notes'] = notes;
    map['user_id'] = userId;
    map['category_id'] = categoryId;
    map['currency_id'] = currencyId;
    return map;
  }
}
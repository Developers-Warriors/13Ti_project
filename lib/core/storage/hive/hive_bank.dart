import 'package:hive/hive.dart';

part 'hive_bank.g.dart';

@HiveType(typeId: 0)
class Transaction extends HiveObject {
  @HiveField(0)
  late String name;

@HiveField(1)
  late DateTime dateTime;

@HiveField(2)
  late bool isExpense = true;

@HiveField(3)
  late double amuont;
}

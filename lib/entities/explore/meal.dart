import 'package:isar/isar.dart';

class Meal {
  Id id = Isar.autoIncrement;
  final String mealId;
  final String name;
  final String thumbnail;

  @Index()
  DateTime createdAt = DateTime.now();

  Meal({
    required this.mealId,
    required this.name,
    required this.thumbnail,
  });
}

import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;

  String? name;

  String? fatherName;

  String? motherName;

  String? birthPlace;

  String? phone;

  int? age;
}
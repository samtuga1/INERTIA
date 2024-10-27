import 'package:inertia/models/models.dart';
import 'package:isar/isar.dart';

part 'project.g.dart';

@collection
class Project {
  Id id = Isar.autoIncrement;
  String? name;
  @ignore
  final folders = IsarLinks<Folder>;
}

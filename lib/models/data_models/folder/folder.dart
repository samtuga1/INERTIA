import 'package:inertia/main.dart';
import 'package:isar/isar.dart';

part 'folder.g.dart';

final folderCol = isar.collection<Folder>();

@collection
class Folder {
  Id id = Isar.autoIncrement;
  String? name;
}

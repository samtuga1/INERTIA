import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:inertia/main.dart';
import 'package:inertia/utils/enums.dart';
import 'package:isar/isar.dart';

part 'theme.g.dart';

final themeCol = isar.collection<Theme>();

@collection
class Theme {
  Id id = Isar.autoIncrement;
  @enumerated
  ThemeType theme = ThemeType.dark;

  @enumerated
  FlexScheme scheme = FlexScheme.amber;
}

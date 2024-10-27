import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:inertia/main.dart';
import 'package:inertia/models/models.dart';
import 'package:inertia/utils/enums.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_controller.g.dart';

@riverpod
class ThemeController extends _$ThemeController {
  @override
  ({ThemeType type, FlexScheme scheme}) build() {
    initialize();
    return (type: ThemeType.dark, scheme: FlexScheme.amber);
  }

  void initialize() async {
    await Future.value(0);
    isar.writeTxnSync(() {
      final theme = isar.themes.getSync(1);
      late Theme localTheme;
      if (theme == null) {
        final id = isar.themes.putSync(Theme());
        localTheme = themeCol.getSync(id)!;
      } else {
        localTheme = themeCol.getSync(1)!;
      }

      state = (type: localTheme.theme, scheme: localTheme.scheme);
    });
  }

  void setThemeType(ThemeType type) {
    isar.writeTxnSync(() {
      var theme = themeCol.getSync(1)!..theme = type;
      final id = isar.themes.putSync(theme);
      theme = themeCol.getSync(id)!;

      state = (scheme: theme.scheme, type: theme.theme);
    });
  }

  void setThemeScheme(FlexScheme scheme) {
    isar.writeTxnSync(() {
      var theme = themeCol.getSync(1)!..scheme = scheme;
      final id = isar.themes.putSync(theme);
      theme = themeCol.getSync(id)!;

      state = (scheme: theme.scheme, type: theme.theme);
    });
  }
}

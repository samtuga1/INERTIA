import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inertia/features/theme.dart/theme_controller.dart';
import 'package:inertia/models/models.dart';
import 'package:inertia/router/app_router.dart';
import 'package:inertia/utils/enums.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

late Isar isar;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();

  isar = await Isar.open(
    [
      OrganisationSchema,
      ProjectSchema,
      FolderSchema,
      ThemeSchema,
    ],
    directory: dir.path,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeControllerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Inertia',
      theme: FlexThemeData.light(scheme: themeState.scheme, useMaterial3: true),
      darkTheme: FlexThemeData.dark(scheme: themeState.scheme, useMaterial3: true, dialogBackground: Colors.black54),
      themeMode: switch (themeState.type) {
        ThemeType.light => ThemeMode.light,
        ThemeType.dark => ThemeMode.dark,
      },
      routerConfig: AppRouter.config,
    );
  }
}

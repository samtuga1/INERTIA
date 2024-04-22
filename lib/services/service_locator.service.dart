import 'package:get_it/get_it.dart';
import 'package:inertia/cubits/theme/theme_cubit.dart';
import 'package:inertia/services/app_storage.service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton(AppStorage(prefs));
  getIt.registerSingleton<ThemeCubit>(
    ThemeCubit(getIt.get<AppStorage>())..getStorageTheme(),
  );
}

import 'package:bloc/bloc.dart';
import 'package:inertia/cubits/theme/theme_state.dart';
import 'package:inertia/interfaces/interfaces.dart';
import 'package:inertia/utils/utils.dart';

class ThemeCubit extends Cubit<ThemeState> {
  IAppStorage storage;
  ThemeCubit(this.storage) : super(ThemeState.initial());

  void setTheme(ThemeState state) async {
    await storage.setString(AppStrings.themeKey, state.toJson());
    emit(state);
  }

  Future<void> getStorageTheme() async {
    final data = await storage.getString(AppStrings.themeKey);
    if (data == null) {
      emit(ThemeState.initial());
    } else {
      final state = ThemeState.fromJson(data);
      emit(state);
    }
  }
}

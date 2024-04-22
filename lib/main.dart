import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:inertia/config/config.dart';
import 'package:inertia/cubits/theme/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inertia/cubits/theme/theme_state.dart';
import 'services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppProviders.all,
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Inertia',
            theme: FlexThemeData.light(scheme: state.scheme),
            darkTheme: FlexThemeData.dark(scheme: state.scheme),
            themeMode: state.themeMode,
            routerConfig: AppRouter.config,
          );
        },
      ),
    );
  }
}

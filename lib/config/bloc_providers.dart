import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inertia/cubits/theme/theme_cubit.dart';
import 'package:inertia/services/services.dart';

class AppProviders {
  static List<BlocProvider> all = [
    BlocProvider<ThemeCubit>(
      create: (_) => getIt<ThemeCubit>(),
    ),
  ];
}

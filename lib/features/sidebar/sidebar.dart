import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inertia/utils/utils.dart';

final sidebarStatusProvider = StateProvider<SidebarType>((ref) {
  return SidebarType.project;
});

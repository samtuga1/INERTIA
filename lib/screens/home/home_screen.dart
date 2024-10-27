import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inertia/extensions/extensions.dart';
import 'package:inertia/features/sidebar/sidebar.dart';
import 'package:inertia/features/theme.dart/theme_controller.dart';
import 'package:inertia/screens/screens.dart';
import 'package:inertia/screens/views/folders_view.dart';
import 'package:inertia/utils/enums.dart';
import 'package:inertia/widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeControllerProvider);
    final sidebarState = ref.watch(sidebarStatusProvider);
    return Scaffold(
      backgroundColor: switch (themeState.type) {
        ThemeType.light => null,
        ThemeType.dark => const Color(0xff212121),
      },
      body: Column(
        children: [
          10.verticalSpace,
          const HomeScreenAppBar(),
          10.verticalSpace,
          const Divider(height: 0),
          Expanded(
            child: Row(
              children: [
                const SizedBox(
                  width: 70,
                  child: OrganisationTabview(),
                ),
                const VerticalDivider(width: 1),
                Expanded(
                  child: VerticalSplitView(
                    left: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 150),
                      switchInCurve: Curves.easeInOut,
                      switchOutCurve: Curves.easeInOut,
                      transitionBuilder: (child, animation) {
                        final forward = child.key == Key(SidebarType.collection.name);

                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(forward ? -0.1 : 0.1, 0),
                            end: const Offset(0, 0),
                          ).animate(animation),
                          child: FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        );
                      },
                      child: switch (sidebarState) {
                        SidebarType.collection => FolderView(
                            key: Key(SidebarType.collection.name),
                          ),
                        SidebarType.project => ProjectsView(
                            key: Key(SidebarType.project.name),
                          ),
                      },
                    ),
                    right: Container(),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 0, thickness: 1),
          Row(
            children: [
              TextButton.icon(
                style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(),
                  ),
                ),
                onPressed: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (ctx) => const SettingsDialog(),
                  );
                },
                icon: const Icon(CupertinoIcons.gear, size: 18),
                label: const Text("Preferences"),
              ),
              const Spacer(),
              Text(
                "Made with ❤️ by Samuel Twumasi",
                style: context.theme.textTheme.bodySmall,
              ),
              10.horizontalSpace,
            ],
          ),
        ],
      ),
    );
  }
}

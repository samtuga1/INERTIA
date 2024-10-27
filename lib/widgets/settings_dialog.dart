import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inertia/extensions/extensions.dart';
import 'package:inertia/widgets/widgets.dart';

class SettingsDialog extends ConsumerWidget {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Center(
        child: SizedBox(
          width: context.width * 0.5,
          height: context.height * 0.8,
          child: Material(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              decoration: BoxDecoration(
                color: context.theme.dialogBackgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        "Settings",
                        style: context.theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Transform.translate(
                        offset: const Offset(10, 0),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () => context.pop(),
                          icon: const Icon(Icons.close),
                        ),
                      ),
                    ],
                  ),
                  30.verticalSpace,
                  const TabBar(
                    isScrollable: true,
                    tabs: [
                      Tab(
                        text: "General",
                      ),
                      Tab(
                        text: "Keyboard Bindings",
                      ),
                      Tab(
                        text: "Themes",
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Container(),
                        Container(),
                        const ThemePicker(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

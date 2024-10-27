import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inertia/extensions/extensions.dart';
import 'package:inertia/features/theme.dart/theme_controller.dart';
import 'package:inertia/utils/enums.dart';

class ThemePicker extends ConsumerWidget {
  const ThemePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeController = ref.read(themeControllerProvider.notifier);
    final themeState = ref.watch(themeControllerProvider);
    const colors = FlexScheme.values;
    return Column(
      children: [
        10.verticalSpace,
        Align(
          alignment: Alignment.topRight,
          child: Transform.scale(
            scale: -0.7,
            child: Switch(
              value: switch (themeState.type) {
                ThemeType.light => true,
                ThemeType.dark => false,
              },
              onChanged: (val) => themeController.setThemeType(val ? ThemeType.light : ThemeType.dark),
            ),
          ),
        ),
        10.verticalSpace,
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.only(top: 20),
            itemCount: colors.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 120,
              mainAxisExtent: 120,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 1,
            ),
            itemBuilder: (ctx, index) {
              final lightScheme = FlexThemeData.light(scheme: colors[index], useMaterial3: true);
              final darkScheme = FlexThemeData.light(scheme: colors[index], useMaterial3: true);
              return Theme(
                data: switch (themeState.type) {
                  ThemeType.light => lightScheme,
                  ThemeType.dark => darkScheme,
                },
                child: Builder(builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        toCamelCase(colors[index].name),
                        style: ctx.theme.textTheme.bodySmall?.copyWith(
                          color: switch (themeState.type) {
                            ThemeType.light => Colors.black,
                            ThemeType.dark => Colors.white,
                          },
                        ),
                      ),
                      5.verticalSpace,
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () => themeController.setThemeScheme(colors[index]),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: switch (themeState.scheme == colors[index]) {
                                true => Border.all(
                                    color: context.theme.primaryColor,
                                    width: 3,
                                  ),
                                false => Border.all(
                                    color: ctx.theme.dividerColor,
                                    width: 0.2,
                                  ),
                              },
                            ),
                            child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: context.theme.primaryColor.withOpacity(0.05),
                              ),
                              child: Column(
                                children: [
                                  9.verticalSpace,
                                  const Divider(thickness: 0.2, height: 0),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: Container(),
                                        ),
                                        const VerticalDivider(thickness: 0.2),
                                        Flexible(
                                          flex: 3,
                                          child: Container(
                                            alignment: Alignment.bottomRight,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: List.generate(
                                                5,
                                                (index) => CircleAvatar(
                                                  backgroundColor: () {
                                                    final schemeColors = [
                                                      context.theme.colorScheme.primary,
                                                      context.theme.colorScheme.secondary,
                                                      context.theme.colorScheme.tertiary,
                                                      context.theme.colorScheme.surfaceTint,
                                                      context.theme.colorScheme.tertiaryContainer,
                                                    ];

                                                    return schemeColors[index];
                                                  }(),
                                                  radius: 3,
                                                ).paddingOnly(right: 3),
                                              ),
                                            ).paddingOnly(right: 5, bottom: 5),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              );
            },
          ),
        ),
      ],
    );
  }
}

String toCamelCase(String input) {
  return input
      .replaceAllMapped(
        RegExp(r'([a-z])([A-Z])'),
        (Match match) => '${match.group(1)} ${match.group(2)}',
      )
      .replaceFirstMapped(
        RegExp(r'^[a-z]'),
        (Match match) => match.group(0)!.toUpperCase(),
      );
}

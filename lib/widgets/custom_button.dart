import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:inertia/extensions/extensions.dart';
import 'package:inertia/widgets/widgets.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final Widget? child;
  final Color? textColor;
  final bool addBorder;
  final bool isBusy;
  final bool isValidated;
  final double? borderRadius, borderWidth;
  final EdgeInsets padding;

  const CustomButton({
    super.key,
    this.title,
    required this.onPressed,
    this.textStyle,
    this.borderRadius,
    this.textColor,
    this.padding = const EdgeInsets.symmetric(
      vertical: 18,
      horizontal: 12,
    ),
    this.child,
    this.borderWidth,
    this.addBorder = false,
    this.isBusy = false,
    this.isValidated = true,
  }) : assert(
          title == null || child == null,
          'Cannot provide both a title and a child\n'
          'To provide both, use "child: Text(title)".',
        );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = Theme.of(context).buttonTheme.colorScheme!;
    final primaryColor = Theme.of(context).primaryColor;
    final borderRadius = BorderRadius.circular(this.borderRadius ?? 4);
    final buttonBorderColor = primaryColor.withOpacity(0.5);

    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: addBorder ? Colors.transparent : null,
        buttonTheme: ButtonThemeData(
          colorScheme: colorScheme.copyWith(
            onPrimary: (addBorder && isValidated)
                ? primaryColor
                : (addBorder && !isValidated)
                    ? theme.disabledColor
                    : null,
          ),
        ),
      ),
      child: Builder(
        builder: (ctx) {
          // final colorScheme = Theme.of(ctx).buttonTheme.colorScheme!;
          return ElevatedButton(
            onPressed: isValidated && !isBusy ? onPressed : null,
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith((states) {
                final isLightMode =
                    Theme.of(context).brightness == Brightness.light;
                if (addBorder) {
                  if (states.contains(MaterialState.hovered) && isLightMode) {
                    return colorScheme.onPrimary;
                  }
                  return colorScheme.onBackground;
                }
                if (isLightMode) {
                  return Colors.white;
                }
                return Colors.black;
              }),
              elevation: const MaterialStatePropertyAll(0),
              padding: MaterialStatePropertyAll(padding),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.hovered)) {
                  if (addBorder) {
                    return Theme.of(context).primaryColor.withOpacity(0.5);
                  }
                  return Theme.of(ctx).primaryColor.withOpacity(0.8);
                }
                return Theme.of(ctx).primaryColor;
              }),
              shape: MaterialStatePropertyAll(switch (addBorder) {
                true => RoundedRectangleBorder(
                    borderRadius: borderRadius,
                    side: BorderSide(
                      width: borderWidth ?? 1,
                      color: isValidated
                          ? isBusy
                              ? theme.disabledColor
                              : buttonBorderColor
                          : theme.disabledColor,
                    ),
                  ),
                false => RoundedRectangleBorder(
                    borderRadius: borderRadius,
                  ),
              }),
            ),
            // ElevatedButton.styleFrom(

            //   // disabledBackgroundColor: colorScheme.onSurface.withOpacity(0.12),
            //   // foregroundColor: colorScheme.onPrimary,
            //   // disabledForegroundColor: colorScheme.onSurface.withOpacity(0.38),
            //   // minimumSize: Size.zero,

            // ),
            child: !isBusy
                ? child ??
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(title!),
                      ],
                    )
                : const CustomLoader(
                    height: 15,
                    width: 15,
                  ).paddingSymmetric(vertical: 3.5),
          );
        },
      ),
    );
  }
}

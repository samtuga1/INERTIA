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
  final EdgeInsets? padding;

  const CustomButton({
    super.key,
    this.title,
    required this.onPressed,
    this.textStyle,
    this.borderRadius,
    this.textColor,
    this.padding,
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
    final borderRadius = BorderRadius.circular(this.borderRadius ?? 25);
    final buttonBorderColor = primaryColor;

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
        builder: (context) {
          final colorScheme = Theme.of(context).buttonTheme.colorScheme!;
          return ElevatedButton(
            onPressed: isValidated && !isBusy ? onPressed : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              disabledBackgroundColor: colorScheme.onSurface.withOpacity(0.12),
              foregroundColor: colorScheme.onPrimary,
              disabledForegroundColor: colorScheme.onSurface.withOpacity(0.38),
              minimumSize: Size.zero,
              elevation: 0,
              padding: padding ?? const EdgeInsets.symmetric(vertical: 13.5),
              shape: addBorder
                  ? RoundedRectangleBorder(
                      borderRadius: borderRadius,
                      side: BorderSide(
                        width: borderWidth ?? 1,
                        color: isValidated
                            ? isBusy
                                ? theme.disabledColor
                                : buttonBorderColor
                            : theme.disabledColor,
                      ),
                    )
                  : RoundedRectangleBorder(
                      borderRadius: borderRadius,
                    ),
            ),
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inertia/extensions/extensions.dart';
import 'package:inertia/utils/validators.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String? labelText, hintText;
  final String? initialValue, prefixText, suffixText;
  final Widget? prefixIcon, suffixIcon;
  final TextInputType keyboardType;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? controller;
  final ValueChanged<String?>? onChanged, onSaved;
  final int? maxLength, maxLines;
  final int? minLines;
  final bool readOnly, addHint, enabled, obscureText, filled;
  final bool? isDense;
  final EdgeInsetsGeometry? contentPadding;
  final Function()? onTap;
  final AutovalidateMode autoValidateMode;
  final BoxConstraints? suffixIconConstraints;
  final EdgeInsets? prefixIconPadding;
  final Color? fillColor, textColor, suffixIconColor;
  final Color? borderColor;
  final double? borderRadius, fontSize, cursorHeight;
  final String? enteredText;
  final bool expands;
  final InputBorder? focusedBorder, enabledBorder, border;
  final FocusNode? focusNode;
  final TextStyle? style, prefixStyle, suffixStyle, hintStyle;
  final Function(String)? onFieldSubmitted;

  const CustomTextFieldWidget({
    super.key,
    this.cursorHeight,
    this.labelText,
    thisintText,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.onFieldSubmitted,
    this.suffixIconColor,
    this.keyboardType = TextInputType.text,
    this.validator = Validators.validateEmpty,
    this.onChanged,
    this.hintText,
    this.hintStyle,
    this.onSaved,
    this.prefixStyle,
    this.filled = true,
    this.suffixStyle,
    this.textColor,
    this.style,
    this.maxLength,
    this.maxLines,
    this.obscureText = false,
    this.minLines,
    this.initialValue,
    this.readOnly = false,
    this.onTap,
    this.enabled = true,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.addHint = false,
    this.suffixIconConstraints,
    this.prefixText,
    this.suffixText,
    this.isDense = true,
    this.contentPadding,
    this.prefixIconPadding,
    this.fillColor,
    this.borderColor,
    this.enteredText,
    this.borderRadius,
    this.expands = false,
    this.focusedBorder,
    this.enabledBorder,
    this.border,
    this.focusNode,
    thisintStyle,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = style ?? context.theme.textTheme.bodyMedium!.copyWith(fontSize: 13);
    return TextFormField(
      cursorHeight: cursorHeight ?? 20,
      cursorColor: context.theme.primaryColor,
      focusNode: focusNode,
      textAlign: TextAlign.start,
      style: textStyle,
      expands: expands,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
      readOnly: readOnly,
      initialValue: initialValue,
      keyboardType: keyboardType,
      autovalidateMode: autoValidateMode,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      onChanged: onChanged,
      minLines: minLines,
      maxLines: maxLines,
      onSaved: onSaved,
      enabled: enabled,
      inputFormatters: maxLength == null
          ? null
          : [
              LengthLimitingTextInputFormatter(maxLength),
              if (keyboardType == TextInputType.number) FilteringTextInputFormatter.digitsOnly,
            ],
      decoration: InputDecoration(
        counterText: enteredText == null ? null : '${enteredText!.length}/$maxLength',
        // fillColor: context.theme.primaryColor.withOpacity(0.025),
        contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 17, vertical: 14.5),
        // filled: filled,
        isDense: isDense,
        // focusedBorder: focusedBorder ??
        //     OutlineInputBorder(
        //       borderSide: BorderSide(
        //         width: 0.50,
        //         color: borderColor ?? context.theme.primaryColor.withOpacity(0.5),
        //       ),
        //       borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 8)),
        //     ),
        // disabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 8)),
        // ),
        // enabledBorder: enabledBorder ??
        //     OutlineInputBorder(
        //       borderSide: const BorderSide(
        //         width: 0.50,
        //         // color: borderColor ?? const Color(0xFFE4E4E4),
        //       ),
        //       borderRadius: BorderRadius.all(
        //         Radius.circular(borderRadius ?? 5),
        //       ),
        //     ),
        // suffixIconColor: suffixIconColor ?? context.theme.primaryColor,
        border: border ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                // color: borderColor ?? context.theme.primaryColor,
                width: 0.50,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius ?? 5),
              ),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 0.50),
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius ?? 5),
          ),
        ),
        labelText: addHint ? null : ((controller?.text != null || !readOnly) ? labelText : null),
        // hintStyle: hintStyle ??
        //     context.theme.textTheme.labelMedium?.copyWith(
        //       fontSize: 12,
        //       fontWeight: FontWeight.w400,
        //     ),
        hintText: hintText,
        prefixIconConstraints: const BoxConstraints(
          maxHeight: 40,
          maxWidth: 40,
        ),
        prefixIcon: prefixIcon == null
            ? null
            : Padding(
                padding: prefixIconPadding ?? const EdgeInsets.only(left: 10, right: 8),
                child: prefixIcon,
              ),
        prefixText: prefixText,
        suffixText: suffixText,
        prefixStyle: prefixStyle,
        suffixStyle: suffixStyle,
        suffixIcon: suffixIcon == null
            ? null
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: suffixIcon,
              ),
        suffixIconConstraints: suffixIconConstraints ??
            const BoxConstraints(
              maxHeight: 40,
              maxWidth: 40,
            ),
      ),
      cursorOpacityAnimates: true,
      onTapOutside: (event) {
        FocusScope.of(context).requestFocus(FocusNode());
      },
    );
  }
}

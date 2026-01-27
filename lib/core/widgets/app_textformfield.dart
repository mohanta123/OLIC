import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  // 🔹 Controllers & focus
  final TextEditingController? controller;
  final FocusNode? focusNode;

  // 🔹 Text behavior
  final String? initialValue;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? errorText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final bool enableObscureToggle; // ✅ NEW
  final int maxLines;
  final int minLines;
  final int? maxLength;
  final bool hideCounter; // ✅ NEW
  final bool readOnly;
  final bool enabled;
  final TextCapitalization textCapitalization; // ✅ NEW
  final TextAlign textAlign; // ✅ NEW
  final Iterable<String>? autofillHints; // ✅ NEW

  // 🔹 Icons
  final IconData? prefixIcon;
  final Widget? prefix;
  final IconData? suffixIcon;
  final Widget? suffix;

  // 🔹 Validation & callbacks
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final VoidCallback? onTap;

  // 🔹 Input formatters
  final List<TextInputFormatter>? inputFormatters;

  // 🔹 Style & layout
  final EdgeInsetsGeometry contentPadding;
  final double borderRadius;
  final Color? fillColor;
  final Color? cursorColor; // ✅ NEW
  final bool borderless; // ✅ NEW

  const AppTextFormField({
    super.key,
    this.controller,
    this.focusNode,
    this.initialValue,
    this.hintText,
    this.labelText,
    this.helperText,
    this.errorText,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.enableObscureToggle = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.hideCounter = false,
    this.readOnly = false,
    this.enabled = true,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.autofillHints,
    this.prefixIcon,
    this.prefix,
    this.suffixIcon,
    this.suffix,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.inputFormatters,
    this.contentPadding =
    const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
    this.borderRadius = 12,
    this.fillColor,
    this.cursorColor,
    this.borderless = false,
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> obscureNotifier =
    ValueNotifier<bool>(obscureText);

    return ValueListenableBuilder<bool>(
      valueListenable: obscureNotifier,
      builder: (context, isObscure, _) {
        return TextFormField(
          controller: controller,
          focusNode: focusNode,
          initialValue: controller == null ? initialValue : null,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          obscureText: isObscure,
          maxLines: isObscure ? 1 : maxLines,
          minLines: minLines,
          maxLength: maxLength,
          readOnly: readOnly,
          enabled: enabled,
          validator: validator,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          onTap: onTap,
          inputFormatters: inputFormatters,
          textCapitalization: textCapitalization,
          textAlign: textAlign,
          autofillHints: autofillHints,
          cursorColor: cursorColor ?? AppColors.primary,
          style: const TextStyle(color: AppColors.textPrimary),

          decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            helperText: helperText,
            errorText: errorText,
            counterText: hideCounter ? "" : null,

            filled: true,
            fillColor: fillColor ?? AppColors.card,

            prefixIcon: prefixIcon != null
                ? Icon(prefixIcon, color: AppColors.primary)
                : prefix,

            suffixIcon: enableObscureToggle
                ? IconButton(
              icon: Icon(
                isObscure ? Icons.visibility_off : Icons.visibility,
                color: AppColors.textSecondary,
              ),
              onPressed: () =>
              obscureNotifier.value = !obscureNotifier.value,
            )
                : (suffixIcon != null
                ? Icon(suffixIcon, color: AppColors.textSecondary)
                : suffix),

            contentPadding: contentPadding,

            enabledBorder:
            borderless ? InputBorder.none : _border(AppColors.border),
            focusedBorder:
            borderless ? InputBorder.none : _border(AppColors.primary),
            errorBorder:
            borderless ? InputBorder.none : _border(AppColors.danger),
            focusedErrorBorder:
            borderless ? InputBorder.none : _border(AppColors.danger),
            disabledBorder: borderless
                ? InputBorder.none
                : _border(AppColors.border.withOpacity(0.5)),
          ),
        );
      },
    );
  }

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: color),
    );
  }
}

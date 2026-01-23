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
  final int maxLines;
  final int minLines;
  final int? maxLength;
  final bool readOnly;
  final bool enabled;

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

  // 🔹 Input formatters (✅ NEW)
  final List<TextInputFormatter>? inputFormatters;

  // 🔹 Style & layout
  final EdgeInsetsGeometry contentPadding;
  final double borderRadius;
  final Color? fillColor;

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
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.readOnly = false,
    this.enabled = true,
    this.prefixIcon,
    this.prefix,
    this.suffixIcon,
    this.suffix,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.inputFormatters, // ✅ ADDED
    this.contentPadding =
    const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
    this.borderRadius = 12,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      initialValue: controller == null ? initialValue : null,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      maxLines: obscureText ? 1 : maxLines,
      minLines: minLines,
      maxLength: maxLength,
      readOnly: readOnly,
      enabled: enabled,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      onTap: onTap,
      inputFormatters: inputFormatters, // ✅ USED HERE
      style: const TextStyle(color: AppColors.textPrimary),

      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        errorText: errorText,

        filled: true,
        fillColor: fillColor ?? AppColors.card,

        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: AppColors.primary)
            : prefix,
        suffixIcon: suffixIcon != null
            ? Icon(suffixIcon, color: AppColors.textSecondary)
            : suffix,

        contentPadding: contentPadding,

        enabledBorder: _border(AppColors.border),
        focusedBorder: _border(AppColors.primary),
        errorBorder: _border(AppColors.danger),
        focusedErrorBorder: _border(AppColors.danger),
        disabledBorder: _border(AppColors.border.withOpacity(0.5)),
      ),
    );
  }

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: color),
    );
  }
}

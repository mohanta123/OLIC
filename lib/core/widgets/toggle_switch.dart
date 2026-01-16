import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ToggleSwitch extends StatelessWidget {
  final bool value;
  final String title;
  final ValueChanged<bool> onChanged;

  const ToggleSwitch({
    super.key,
    required this.value,
    required this.title,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      activeColor: AppColors.success,
      value: value,
      onChanged: onChanged,
    );
  }
}

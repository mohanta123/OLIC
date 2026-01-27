import 'package:flutter/material.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';

class EnvironmentCard extends StatelessWidget {
  final bool motorOn;
  final String temperature;
  final String humidity;
  final ValueChanged<bool> onMotorChanged;

  const EnvironmentCard({
    super.key,
    required this.motorOn,
    required this.temperature,
    required this.humidity,
    required this.onMotorChanged,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🔹 Title
        Text(
          t.t('real_time_monitoring'),
          style: theme.textTheme.headlineSmall,
        ),
        const SizedBox(height: 12),

        /// 🌡 Temperature + 💧 Humidity Card
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _envItem(
                  context,
                  title: t.t('temperature'),
                  value: temperature,
                  sub: t.t('hot_weather'),
                  valueColor: AppColors.danger,
                ),
                const VerticalDivider(width: 32),
                _envItem(
                  context,
                  title: t.t('humidity'),
                  value: humidity,
                  valueColor: AppColors.success,
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        /// ⚙️ Motor Status Switch
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t.t('motor'),
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  motorOn
                      ? t.t('motor_power_on')
                      : t.t('motor_power_off'),
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
            Switch(
              value: motorOn,
              onChanged: onMotorChanged,
            ),
          ],
        ),
      ],
    );
  }

  Widget _envItem(
      BuildContext context, {
        required String title,
        required String value,
        String? sub,
        required Color valueColor,
      }) {
    final theme = Theme.of(context);

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: theme.textTheme.headlineLarge?.copyWith(
              color: valueColor,
            ),
          ),
          if (sub != null) ...[
            const SizedBox(height: 4),
            Text(
              sub,
              style: theme.textTheme.bodySmall,
            ),
          ],
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/localization/app_localizations.dart';

class EnvironmentCard extends StatelessWidget {
  final bool motorOn;
  final ValueChanged<bool> onMotorChanged;

  const EnvironmentCard({
    super.key,
    required this.motorOn,
    required this.onMotorChanged,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔹 Title
        Text(
          t.t('real_time_monitoring'),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),

        // 🌡 Temperature + 💧 Humidity Card
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              _envItem(
                title: t.t('temperature'),
                value: '30°',
                sub: t.t('hot_weather'),
                valueColor: AppColors.danger,
              ),
              const VerticalDivider(width: 32),
              _envItem(
                title: t.t('humidity'),
                value: '60%',
                valueColor: AppColors.success,
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // ⚙️ Motor Starter Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t.t('motor'),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  t.t('motor_power_on'),
                  style: const TextStyle(color: Colors.black54),
                ),
              ],
            ),
            Switch(
              value: motorOn,
              activeColor: AppColors.success,
              onChanged: onMotorChanged,
            ),
          ],
        ),
      ],
    );
  }

  Widget _envItem({
    required String title,
    required String value,
    String? sub,
    required Color valueColor,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
          if (sub != null) ...[
            const SizedBox(height: 4),
            Text(
              sub,
              style: const TextStyle(color: Colors.black54),
            ),
          ]
        ],
      ),
    );
  }
}

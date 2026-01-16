import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_app_bar.dart';
import '../../../core/widgets/app_drawer.dart';
import '../../../core/widgets/info_card.dart';
import '../../../core/localization/app_localizations.dart';
import '../widgets/environment_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool motorOn = true;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppAppBar(
        title: t.t('dashboard'),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 12),
          Icon(Icons.notifications_none),
          SizedBox(width: 12),
          Icon(Icons.power_settings_new),
          SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🌡 Environment Card
            EnvironmentCard(
              motorOn: motorOn,
              onMotorChanged: (v) => setState(() => motorOn = v),
            ),

            const SizedBox(height: 24),

            // 📊 Section Title
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                t.t('visual_data_feedback'),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 📊 Usage Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              children: [
                InfoCard(
                  title: t.t('energy_consumption'),
                  subtitle: t.t('water'),
                  time: '8:00AM TO 12:00PM',
                  value: '5.9',
                  unit: 'kWh',
                  color: AppColors.primary,
                  icon: Icons.water_drop,
                ),
                InfoCard(
                  title: t.t('energy_consumption'),
                  subtitle: t.t('electricity'),
                  value: '750',
                  unit: 'W',
                  color: AppColors.danger,
                  icon: Icons.flash_on,
                ),
                InfoCard(
                  title: t.t('power_leakage'),
                  time: t.t('from_11_am'),
                  value: t.t('yes'),
                  color: AppColors.success,
                  icon: Icons.warning,
                  bottom: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      t.t('yes'),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                InfoCard(
                  title: t.t('alerts'),
                  time: t.t('from_2_am'),
                  value: '5',
                  unit: t.t('notifications'),
                  color: AppColors.info,
                  icon: Icons.notifications,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

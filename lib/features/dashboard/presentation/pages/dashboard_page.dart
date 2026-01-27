import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_app_bar.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../core/widgets/app_images.dart';
import '../../../../core/widgets/info_card.dart';
import '../../../../core/localization/app_localizations.dart';

import '../../../auth/presentation/provider/auth_provider.dart';
import '../provider/dashboard_provider.dart';
import '../widgets/environment_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final farmers =
          context.read<AuthProvider>().loginResponse?.farmers;
      final deviceId = farmers?.first.motorId ?? "ATPL001";

      context.read<DashboardProvider>().loadStatus(deviceId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final dashboard = context.watch<DashboardProvider>();
    final data = dashboard.status;

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppAppBar(
        title: t.t('dashboard'),
        actions: const [
          Icon(Icons.notifications_none),
          SizedBox(width: 12),
          Icon(Icons.power_settings_new),
          SizedBox(width: 12),
        ],
      ),
      body: dashboard.loading
          ? const Center(child: CircularProgressIndicator())
          : dashboard.error != null
          ? Center(
        child: Text(
          dashboard.error!,
          style: const TextStyle(color: Colors.red),
        ),
      )
          : data == null
          ? Center(child: Text(t.t('no_data_available')))
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// 🌡 Environment Card (LIVE)
            EnvironmentCard(
              motorOn:
              (data.motorStatus ?? "OFF") == "ON",
              temperature:
              "${data.temperature?.toStringAsFixed(1) ?? '--'}°",
              humidity:
              "${data.humidity?.toStringAsFixed(1) ?? '--'}%",
              onMotorChanged: (_) {},
            ),

            const SizedBox(height: 24),

            /// 📊 Section Title
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                t.t('visual_data_feedback'),
                style: theme.textTheme.headlineSmall,
              ),
            ),

            const SizedBox(height: 16),

            /// 📊 Usage Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              children: [
                /// 💧 Water Flow
                InfoCard(
                  title: t.t('energy_consumption'),
                  subtitle: t.t('water'),
                  value:
                  "${data.waterFlow?.toStringAsFixed(1) ?? '--'}",
                  unit: "L",
                  image: AppImages.water,
                  color: AppColors.water,
                ),

                /// ⚡ Power Usage
                InfoCard(
                  title: t.t('energy_consumption'),
                  subtitle: t.t('electricity'),
                  value:
                  "${data.power?.toStringAsFixed(2) ?? '--'}",
                  unit: "kW",
                  image: AppImages.electricity,
                  color: AppColors.electricity,
                ),

                /// 🚨 Power Leakage
                InfoCard(
                  title: t.t('power_leakage'),
                  time: t.t('from_11_am'),
                  image: AppImages.powerLeakage,
                  color: AppColors.leakage,
                  bottom: (data.isEarthFaultsAppear ?? false)
                      ? Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius:
                      BorderRadius.circular(20),
                    ),
                    child: Text(
                      t.t('yes'),
                      style: const TextStyle(
                          color: Colors.white),
                    ),
                  )
                      : null,
                ),

                /// 🔔 Alerts
                InfoCard(
                  title: t.t('alerts'),
                  time: t.t('from_2_am'),
                  value:
                  (data.isHighElectricUsage ?? false)
                      ? "1"
                      : "0",
                  unit: t.t('notifications'),
                  image: AppImages.notification,
                  color: AppColors.alert,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

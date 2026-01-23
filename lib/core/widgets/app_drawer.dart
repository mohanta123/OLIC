import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../utils/constants.dart';
import '../localization/app_localizations.dart';
import '../localization/language_storage.dart';
import '../../main.dart'; // appLocale, themeModeNotifier

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Drawer(
      child: Column(
        children: [
          // 🔷 HEADER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: AppColors.primary,
            child: const SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 36,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Farmer Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'User ID: PMP-1023',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),

          // 📂 NAVIGATION
          _drawerItem(
            context,
            icon: Icons.dashboard,
            title: t.t('dashboard'),
            route: AppRoutes.home,
          ),
          _drawerItem(
            context,
            icon: Icons.settings_input_component,
            title: t.t('register_motor'),
            route: AppRoutes.registerMotor,
          ),
          _drawerItem(
            context,
            icon: Icons.flash_on,
            title: t.t('electricity'),
            route: AppRoutes.electricity,
          ),
          _drawerItem(
            context,
            icon: Icons.water_drop,
            title: t.t('water'),
            route: AppRoutes.water,
          ),
          _drawerItem(
            context,
            icon: Icons.person,
            title: t.t('profile'),
            route: AppRoutes.profile,
          ),

          const Divider(),

          // 🌗 THEME TOGGLE
          ValueListenableBuilder<ThemeMode>(
            valueListenable: themeModeNotifier,
            builder: (context, mode, _) {
              return SwitchListTile(
                secondary: const Icon(Icons.brightness_6),
                title: Text(t.t('theme')),
                subtitle: Text(
                  mode == ThemeMode.dark
                      ? t.t('dark_mode')
                      : t.t('light_mode'),
                ),
                value: mode == ThemeMode.dark,
                onChanged: (isDark) {
                  themeModeNotifier.value =
                  isDark ? ThemeMode.dark : ThemeMode.light;
                },
              );
            },
          ),

          // 🌐 LANGUAGE
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(t.t('language')),
            onTap: () {
              Navigator.pop(context); // close drawer safely
              _showLanguageDialog(context);
            },
          ),

          const Spacer(),

          // 🚪 LOGOUT
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: AppColors.danger),
            title: Text(t.t('logout')),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.login,
                    (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }

  // 🔹 Drawer Item
  Widget _drawerItem(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String route,
      }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }

  // 🌐 Language Dialog
  void _showLanguageDialog(BuildContext context) {
    final t = AppLocalizations.of(context);

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(t.t('choose_language')),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _languageTile(
              parentContext: dialogContext,
              title: t.t('english'),
              locale: const Locale('en'),
            ),
            _languageTile(
              parentContext: dialogContext,
              title: t.t('odia'),
              locale: const Locale('or'),
            ),
          ],
        ),
      ),
    );
  }


  Widget _languageTile({
    required BuildContext parentContext,
    required String title,
    required Locale locale,
  }) {
    final bool selected =
        appLocale.value.languageCode == locale.languageCode;

    return ListTile(
      leading: Icon(
        selected ? Icons.radio_button_checked : Icons.radio_button_off,
        color: selected ? AppColors.primary : Colors.grey,
      ),
      title: Text(title),
      onTap: () async {
        // ✅ CLOSE dialog FIRST (safe)
        Navigator.of(parentContext, rootNavigator: true).pop();

        // ✅ THEN update language
        appLocale.value = locale;
        await LanguageStorage.save(locale);
      },
    );
  }

}

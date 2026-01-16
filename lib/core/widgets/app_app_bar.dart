import 'package:flutter/material.dart';

import '../localization/app_localizations.dart';
import '../theme/app_colors.dart';
import '../../main.dart'; // appLocale
import '../localization/language_storage.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final List<Widget>? actions;

  const AppAppBar({
    super.key,
    required this.title,
    this.showBack = false,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      automaticallyImplyLeading: showBack,
      title: Text(title),
      actions: [
        // 🌐 Language chooser
        IconButton(
          tooltip: 'Language',
          icon: const Icon(Icons.language),
          onPressed: () => _showLanguageDialog(context),
        ),

        if (actions != null) ...actions!,
      ],
    );
  }

  void _showLanguageDialog(BuildContext context) {
    final t = AppLocalizations.of(context);

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(t.t('choose_language')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _languageTile(
                context,
                title: t.t('english'),
                locale: const Locale('en'),
              ),
              _languageTile(
                context,
                title: t.t('odia'),
                locale: const Locale('or'),
              ),
            ],
          ),
        );
      },
    );
  }


  Widget _languageTile(
      BuildContext context, {
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
        appLocale.value = locale;
        await LanguageStorage.save(locale);
        Navigator.pop(context);
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

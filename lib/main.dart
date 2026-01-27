import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'core/localization/language_storage.dart';
import 'core/localization/app_localizations_delegate.dart';
import 'core/network/network_wrapper.dart';
import 'core/utils/app_router.dart';
import 'core/utils/constants.dart';
import 'core/theme/app_theme.dart';
import 'di/injector.dart';

// 🌐 Language notifier
ValueNotifier<Locale> appLocale = ValueNotifier(const Locale('en'));

// 🌗 Theme notifier
ValueNotifier<ThemeMode> themeModeNotifier =
ValueNotifier(ThemeMode.light);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🌍 Load saved language
  final savedLocale = await LanguageStorage.load();
  appLocale.value = savedLocale;

  runApp(
    MultiProvider(
      providers: providers, // 👈 from injector.dart
      child: const OlicApp(),
    ),
  );
}
class OlicApp extends StatelessWidget {
  const OlicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: appLocale,
      builder: (_, locale, __) {
        return ValueListenableBuilder<ThemeMode>(
          valueListenable: themeModeNotifier,
          builder: (_, themeMode, __) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: themeMode,
              locale: locale,
              supportedLocales: const [
                Locale('en'),
                Locale('or'),
              ],
              localizationsDelegates: const [
                AppLocalizationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              initialRoute: AppRoutes.welcome,
              onGenerateRoute: AppRouter.generateRoute,

              // ✅ THIS FIXES EVERYTHING
              builder: (context, child) {
                return NetworkWrapper(child: child!);
              },
            );
          },
        );
      },
    );
  }
}



import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/localization/language_storage.dart';
import 'core/localization/app_localizations_delegate.dart';
import 'core/utils/app_router.dart';
import 'core/utils/constants.dart';
import 'core/theme/app_theme.dart';

ValueNotifier<Locale> appLocale = ValueNotifier(const Locale('en'));



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedLocale = await LanguageStorage.load();
  appLocale.value = savedLocale;
  runApp(const OlicApp());
}


class OlicApp extends StatelessWidget {
  const OlicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: appLocale,
      builder: (_, locale, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          locale: locale,
          supportedLocales: const [
            Locale('en'),
            Locale('or'),
          ],
          localizationsDelegates: [
            const AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          initialRoute: AppRoutes.welcome,
          onGenerateRoute: AppRouter.generateRoute,
        );
      },
    );
  }
}

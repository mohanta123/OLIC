import 'package:flutter/material.dart';

import '../../features/auth/presentation/welcome_page.dart';
import '../../features/auth/presentation/login_page.dart';
import '../../features/auth/presentation/otp_page.dart';
import '../../features/register/registerMotorPage.dart';
import '../../navigation/bottom_nav_page.dart';
import '../../features/electricity/presentation/electricity_page.dart';
import '../../features/water/presentation/water_page.dart';
import '../../features/profile/presentation/profile_page.dart';
import 'constants.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.welcome:
        return MaterialPageRoute(builder: (_) => const WelcomePage());

      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case AppRoutes.otp:
        return MaterialPageRoute(builder: (_) => const OtpPage());

      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const BottomNavPage());

      case AppRoutes.electricity:
        return MaterialPageRoute(builder: (_) => const ElectricityPage());

      case AppRoutes.water:
        return MaterialPageRoute(builder: (_) => const WaterPage());

      case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case AppRoutes.registerMotor:
        return MaterialPageRoute(
          builder: (_) => const RegisterMotorPage(),
        );


      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Route Not Found')),
          ),
        );
    }
  }
}

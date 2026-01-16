import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../utils/constants.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // 🔷 Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: AppColors.primary,
            child: const SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person,
                        size: 36, color: AppColors.primary),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Farmer Name',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
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

          // 📂 Menu Items
          _drawerItem(
            context,
            icon: Icons.dashboard,
            title: 'Dashboard',
            route: AppRoutes.home,
          ),
          _drawerItem(
            context,
            icon: Icons.flash_on,
            title: 'Electricity',
            route: AppRoutes.electricity,
          ),
          _drawerItem(
            context,
            icon: Icons.water_drop,
            title: 'Water',
            route: AppRoutes.water,
          ),
          _drawerItem(
            context,
            icon: Icons.person,
            title: 'Profile',
            route: AppRoutes.profile,
          ),

          const Spacer(),

          // 🚪 Logout
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: AppColors.danger),
            title: const Text('Logout'),
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
}

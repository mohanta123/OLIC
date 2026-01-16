import 'package:flutter/material.dart';
import '../features/dashboard/presentation/dashboard_page.dart';
import '../features/electricity/presentation/electricity_page.dart';
import '../features/water/presentation/water_page.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _index = 0;

  final pages = const [
    DashboardPage(),
    ElectricityPage(),
    WaterPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.flash_on), label: 'Electricity'),
          BottomNavigationBarItem(icon: Icon(Icons.water_drop), label: 'Water'),
        ],
      ),
    );
  }
}

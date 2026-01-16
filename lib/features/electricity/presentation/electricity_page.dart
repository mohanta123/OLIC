import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_app_bar.dart';
import '../../../core/widgets/app_drawer.dart';
import '../../../core/localization/app_localizations.dart';

class ElectricityPage extends StatefulWidget {
  const ElectricityPage({super.key});

  @override
  State<ElectricityPage> createState() => _ElectricityPageState();
}

class _ElectricityPageState extends State<ElectricityPage> {
  final TextEditingController _searchCtrl = TextEditingController();

  final List<Map<String, String>> electricityData = [
    {
      'pumpId': 'PMP-1001',
      'location': 'Cuttack / Banki',
      'date': '15-01-2026',
      'start': '06:00',
      'end': '10:30',
      'hours': '4.5',
      'energy': '124 kWh',
      'cost': '₹620',
      'remarks': 'Normal',
    },
    {
      'pumpId': 'PMP-1002',
      'location': 'Khordha / Balianta',
      'date': '15-01-2026',
      'start': '07:15',
      'end': '11:00',
      'hours': '3.75',
      'energy': '98 kWh',
      'cost': '₹490',
      'remarks': 'Normal',
    },
  ];

  List<Map<String, String>> filteredData = [];

  @override
  void initState() {
    super.initState();
    filteredData = electricityData;
  }

  void _onSearch(String value) {
    setState(() {
      filteredData = electricityData
          .where((e) =>
      e['pumpId']!.toLowerCase().contains(value.toLowerCase()) ||
          e['location']!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppAppBar(
        title: t.t('electricity'),
        showBack: false,
      ),
      body: Column(
        children: [
          _searchBar(t),
          Expanded(
            child: filteredData.isEmpty
                ? Center(child: Text(t.t('no_records')))
                : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: filteredData.length,
              itemBuilder: (_, index) =>
                  _electricityCard(filteredData[index], t),
            ),
          ),
        ],
      ),
    );
  }

  // 🔍 Search Bar
  Widget _searchBar(AppLocalizations t) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextField(
        controller: _searchCtrl,
        onChanged: _onSearch,
        decoration: InputDecoration(
          hintText: t.t('search'),
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  // 📋 Electricity Card
  Widget _electricityCard(
      Map<String, String> data, AppLocalizations t) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _row(t.t('pump_id'), data['pumpId']!, bold: true),
            _row(t.t('location'), data['location']!),
            const Divider(),

            _doubleRow(
              t.t('date'),
              data['date']!,
              t.t('running_hours'),
              data['hours']!,
            ),
            _doubleRow(
              t.t('start_time'),
              data['start']!,
              t.t('end_time'),
              data['end']!,
            ),
            _doubleRow(
              t.t('energy_consumed'),
              data['energy']!,
              t.t('avg_cost'),
              data['cost']!,
            ),

            const Divider(),

            _row(
              t.t('remarks'),
              t.t('normal'),
              valueColor: AppColors.success,
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Single Row
  Widget _row(
      String label,
      String value, {
        bool bold = false,
        Color? valueColor,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: TextStyle(
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Two Column Row
  Widget _doubleRow(
      String l1,
      String v1,
      String l2,
      String v2,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: _miniTile(l1, v1)),
          const SizedBox(width: 8),
          Expanded(child: _miniTile(l2, v2)),
        ],
      ),
    );
  }

  Widget _miniTile(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.black54)),
        const SizedBox(height: 2),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }
}

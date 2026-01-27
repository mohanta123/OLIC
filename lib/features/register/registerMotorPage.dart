import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/localization/app_localizations.dart';

class RegisterMotorPage extends StatefulWidget {
  const RegisterMotorPage({super.key});

  @override
  State<RegisterMotorPage> createState() => _RegisterMotorPageState();
}

class _RegisterMotorPageState extends State<RegisterMotorPage> {
  final _formKey = GlobalKey<FormState>();

  final nameCtrl = TextEditingController();
  final mobileCtrl = TextEditingController();
  final aadhaarCtrl = TextEditingController();
  final motorIdCtrl = TextEditingController();
  final locationCtrl = TextEditingController();

  @override
  void dispose() {
    nameCtrl.dispose();
    mobileCtrl.dispose();
    aadhaarCtrl.dispose();
    motorIdCtrl.dispose();
    locationCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.t('register_motor')),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 👤 Name
              TextFormField(
                controller: nameCtrl,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: t.t('name'),
                  prefixIcon: const Icon(Icons.person),
                ),
                validator: (v) =>
                v == null || v.trim().isEmpty ? t.t('name') : null,
              ),

              const SizedBox(height: 16),

              // 📱 Mobile Number
              TextFormField(
                controller: mobileCtrl,
                keyboardType: TextInputType.number,
                maxLength: 10,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  labelText: t.t('mobile_no'),
                  prefixIcon: const Icon(Icons.phone),
                ),
                validator: (v) {
                  if (v == null || v.length != 10) {
                    return t.t('mobile_no');
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // 🪪 Aadhaar Number
              TextFormField(
                controller: aadhaarCtrl,
                keyboardType: TextInputType.number,
                maxLength: 12,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  labelText: t.t('aadhaar_no'),
                  prefixIcon: const Icon(Icons.badge),
                ),
                validator: (v) {
                  if (v == null || v.length != 12) {
                    return t.t('aadhaar_no');
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // ⚙️ Motor ID
              TextFormField(
                controller: motorIdCtrl,
                decoration: InputDecoration(
                  labelText: t.t('motor_id'),
                  prefixIcon:
                  const Icon(Icons.precision_manufacturing),
                ),
                validator: (v) =>
                v == null || v.trim().isEmpty ? t.t('motor_id') : null,
              ),

              const SizedBox(height: 16),

              // 📍 Pump Location
              TextFormField(
                controller: locationCtrl,
                decoration: InputDecoration(
                  labelText: t.t('pump_location'),
                  prefixIcon: const Icon(Icons.location_on),
                ),
                validator: (v) =>
                v == null || v.trim().isEmpty
                    ? t.t('pump_location')
                    : null,
              ),

              const SizedBox(height: 32),

              // ✅ Submit Button (theme-based)
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // TODO: API integration
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(t.t('register_motor')),
                        ),
                      );
                    }
                  },
                  child: Text(t.t('submit')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

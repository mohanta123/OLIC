import 'package:flutter/material.dart';

import '../../../core/utils/constants.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/widgets/app_images.dart';
import '../../../core/widgets/app_textformfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final TextEditingController mobileCtrl = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 🏛 Logo
              Center(
                child: Image.asset(
                  AppImages.logo,
                  height: 80,
                ),
              ),

              const SizedBox(height: 24),

              // 🔐 Login Title (Theme driven)
              Text(
                t.t('login'),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),

              const SizedBox(height: 8),

              // ℹ️ Subtitle (Theme driven)
              Text(
                t.t('enter_mobile'),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              const SizedBox(height: 32),

              // 📱 Mobile / User ID Field
              AppTextFormField(
                controller: mobileCtrl,
                hintText: t.t('enter_mobile'),
                keyboardType: TextInputType.phone,
                prefixIcon: Icons.person_outline,
                textInputAction: TextInputAction.done,maxLength: 10,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return t.t('enter_mobile');
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24),

              // 🔘 Send OTP Button (Theme driven)
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.otp);
                  },
                  child: Text(t.t('send_otp')),
                ),
              ),

              const SizedBox(height: 24),

              // 🔒 Footer note (Theme driven)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.lock_outline, size: 16),
                  const SizedBox(width: 6),
                  Text(
                    t.t('secure_login'),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/localization/app_localizations.dart';
import '../../../core/utils/constants.dart';
import '../../../core/widgets/app_textformfield.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late final TextEditingController otpCtrl;

  @override
  void initState() {
    super.initState();
    otpCtrl = TextEditingController();
  }

  @override
  void dispose() {
    otpCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      // ✅ Theme handles background automatically
      appBar: AppBar(
        title: Text(t.t('otp_verification')),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 📝 Title
            Text(
              t.t('otp_verification'),
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.primaryColor,
              ),
            ),

            const SizedBox(height: 8),

            // ℹ️ Subtitle
            Text(
              t.t('enter_otp'),
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),

            const SizedBox(height: 32),

            // 🔢 OTP Input (6 digits only)
            AppTextFormField(
              controller: otpCtrl,
              hintText: t.t('enter_otp'),
              keyboardType: TextInputType.number,
              maxLength: 6,
              textInputAction: TextInputAction.done,
              prefixIcon: Icons.lock_outline,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return t.t('enter_otp');
                }
                if (value.length != 6) {
                  return t.t('invalid_otp');
                }
                return null;
              },
            ),

            const SizedBox(height: 24),

            // ✅ Verify Button (theme-driven)
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.home,
                        (route) => false,
                  );
                },
                child: Text(t.t('verify')),
              ),
            ),

            const SizedBox(height: 16),

            // 🔁 Resend OTP
            TextButton(
              onPressed: () {
                // TODO: resend OTP logic
              },
              child: Text(t.t('resend_otp')),
            ),
          ],
        ),
      ),
    );
  }
}

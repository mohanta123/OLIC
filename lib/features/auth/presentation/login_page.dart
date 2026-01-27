  import 'package:flutter/material.dart';
  import 'package:olic/features/auth/presentation/provider/auth_provider.dart';
  import 'package:provider/provider.dart';

  import '../../../core/localization/app_localizations.dart';
  import '../../../core/utils/constants.dart';
  import '../../../core/widgets/app_images.dart';
  import '../../../core/widgets/app_textformfield.dart';


  class LoginPage extends StatefulWidget {
    const LoginPage({super.key});

    @override
    State<LoginPage> createState() => _LoginPageState();
  }

  class _LoginPageState extends State<LoginPage> {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController userCtrl = TextEditingController();
    final TextEditingController passCtrl = TextEditingController();
    bool obscure = true;

    @override
    Widget build(BuildContext context) {
      final t = AppLocalizations.of(context);
      final auth = context.watch<AuthProvider>();

      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Image.asset(AppImages.logo, height: 80),
                  ),
                  const SizedBox(height: 24),

                  Text(
                    t.t('login'),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),

                  Text(
                    t.t('enter_credentials'),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  const SizedBox(height: 32),

                  // 👤 Username
                  AppTextFormField(
                    controller: userCtrl,
                    hintText: t.t('username'),
                    prefixIcon: Icons.person_outline,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return t.t('enter_username');
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // 🔑 Password
                  AppTextFormField(
                    controller: passCtrl,
                    hintText: t.t('password'),
                    prefixIcon: Icons.lock_outline,
                    obscureText: obscure,
                    suffix: IconButton(
                      icon: Icon(
                        obscure ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () => setState(() => obscure = !obscure),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return t.t('enter_password');
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 28),

                  // 🚀 Login Button
                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: auth.isLoading
                          ? null
                          : () async {
                        if (!_formKey.currentState!.validate()) return;

                        final success = await auth.login(
                          userCtrl.text.trim(),
                          passCtrl.text.trim(),
                        );

                        if (!mounted) return;

                        if (success) {
                          final response = context.read<AuthProvider>().loginResponse;

                          debugPrint("===== FARMERS LIST =====");

                          for (var farmer in response?.farmers ?? []) {
                            debugPrint(
                                "Farmer: ${farmer.farmerName}, "
                                    "Mobile: ${farmer.mobile}, "
                                    "Motor: ${farmer.motorId}, "
                                    "Active: ${farmer.isActive}"
                            );
                          }

                          debugPrint("========================");

                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.home,
                            arguments: response,
                          );
                        }

                        else if (auth.error != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(auth.error!)),
                          );
                        }
                      },
                      child: auth.isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(t.t('login')),
                    ),
                  ),


                  const SizedBox(height: 24),

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
        ),
      );
    }
  }


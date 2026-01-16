import 'package:flutter/material.dart';
import '../../../core/utils/constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login', style: TextStyle(fontSize: 22)),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Mobile Number / User ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.otp),
              child: const Text('Send OTP'),
            )
          ],
        ),
      ),
    );
  }
}

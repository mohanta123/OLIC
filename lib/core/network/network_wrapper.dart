import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../localization/app_localizations.dart';
import 'network_provider.dart';

class NetworkWrapper extends StatelessWidget {
  final Widget child;
  const NetworkWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Consumer<NetworkProvider>(
      builder: (context, network, _) {
        return Stack(
          children: [
            child,

            if (!network.isConnected)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Material(
                  color: Colors.red,
                  elevation: 10,
                  child: SafeArea(
                    top: false,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.wifi_off, color: Colors.white),
                          const SizedBox(width: 8),
                          Text(
                            t.t('no_internet'), // 🌍 Localized text
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

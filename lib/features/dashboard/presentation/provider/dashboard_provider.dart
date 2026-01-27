import 'package:flutter/material.dart';

import '../../../../core/utils/network_info.dart';
import '../../data/models/motor_status_model.dart';
import '../../domain/usecases/get_motor_status_usecase.dart';

class DashboardProvider extends ChangeNotifier {
  final GetMotorStatusUseCase useCase;
  final NetworkInfo networkInfo; // 👈 ADD

  DashboardProvider(this.useCase, this.networkInfo);

  MotorStatusModel? status;
  bool loading = false;
  String? error;

  Future<void> loadStatus(String deviceId) async {
    // 🌐 INTERNET CHECK
    if (!await networkInfo.isConnected) {
      error = "No internet connection";
      notifyListeners();
      return;
    }

    loading = true;
    error = null;
    notifyListeners();

    try {
      status = await useCase(deviceId);
    } catch (e) {
      error = "Failed to load motor data";
    }

    loading = false;
    notifyListeners();
  }
}

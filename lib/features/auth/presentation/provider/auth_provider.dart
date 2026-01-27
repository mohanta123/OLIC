import 'package:flutter/material.dart';
import '../../../../core/utils/network_info.dart';
import '../../data/models/login_response_model.dart';
import '../../domain/usecases/login_usecase.dart';

class AuthProvider extends ChangeNotifier {
  final LoginUseCase loginUseCase;
  final NetworkInfo networkInfo;

  AuthProvider(this.loginUseCase, this.networkInfo);

  bool isLoading = false;
  String? error;
  LoginResponseModel? loginResponse;

  Future<bool> login(String username, String password) async {
    if (!await networkInfo.isConnected) {
      error = "No internet connection";
      notifyListeners();
      return false;
    }

    isLoading = true;
    error = null;
    notifyListeners();

    try {
      loginResponse = await loginUseCase(username, password);

      debugPrint("===== LOGIN SUCCESS =====");
      debugPrint("Admin: ${loginResponse?.name}");
      return true;
    } catch (e) {
      error = "Login failed. Please try again.";
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

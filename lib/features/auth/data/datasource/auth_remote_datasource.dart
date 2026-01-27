import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../core/utils/urls.dart';
import '../models/login_response_model.dart';

class AuthRemoteDataSource {

  Future<LoginResponseModel> login(String username, String password) async {
    final url = Urls.loginWithFarmers;

    print("🔐 LOGIN URL: $url");
    print("📤 BODY: ${jsonEncode({
      "userName": username,
      "password": password,
    })}");

    final response = await http.post(
      Uri.parse(url),
      headers: {
        "accept": "*/*",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "userName": username,
        "password": password,
      }),
    );

    print("📥 STATUS CODE: ${response.statusCode}");
    print("📦 RESPONSE BODY: ${response.body}");

    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Login failed: ${response.statusCode}");
    }
  }
}

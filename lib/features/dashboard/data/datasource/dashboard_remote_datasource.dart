import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../core/utils/urls.dart';
import '../models/motor_status_model.dart';

class DashboardRemoteDataSource {

  Future<MotorStatusModel> fetchMotorStatus(String deviceId) async {
    final url = Urls.motorStatus(deviceId);

    print("📡 CALLING URL: $url");

    final response = await http.get(
      Uri.parse(url),
      headers: {"accept": "*/*"},
    );

    print("📥 STATUS CODE: ${response.statusCode}");
    print("📦 RESPONSE BODY: ${response.body}");

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);

      if (data.isEmpty) {
        throw Exception("No motor data found");
      }

      return MotorStatusModel.fromJson(data.first);
    } else {
      throw Exception("Server error: ${response.statusCode}");
    }
  }
}

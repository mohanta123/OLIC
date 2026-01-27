class Urls {
  // 🔹 Base URL
  static const String baseUrl = "http://192.168.3.65:92";

  // 🔐 Auth
  static const String loginWithFarmers =
      "$baseUrl/api/Registration/LoginWithFarmers";

  // 📊 Dashboard
  static String motorStatus(String deviceId) =>
      "$baseUrl/api/Home/MotorStatus/$deviceId";
}

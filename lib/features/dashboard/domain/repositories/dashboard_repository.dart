import '../../data/models/motor_status_model.dart';

abstract class DashboardRepository {
  Future<MotorStatusModel> getMotorStatus(String deviceId);
}

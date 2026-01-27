import '../repositories/dashboard_repository.dart';
import '../../data/models/motor_status_model.dart';

class GetMotorStatusUseCase {
  final DashboardRepository repository;

  GetMotorStatusUseCase(this.repository);

  Future<MotorStatusModel> call(String deviceId) {
    return repository.getMotorStatus(deviceId);
  }
}

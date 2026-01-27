import '../../domain/repositories/dashboard_repository.dart';
import '../datasource/dashboard_remote_datasource.dart';
import '../models/motor_status_model.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remote;

  DashboardRepositoryImpl(this.remote);

  @override
  Future<MotorStatusModel> getMotorStatus(String deviceId) {
    return remote.fetchMotorStatus(deviceId);
  }
}

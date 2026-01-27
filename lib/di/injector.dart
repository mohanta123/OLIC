import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:provider/provider.dart';

// 🌐 Core
import '../core/network/network_provider.dart';
import '../core/utils/network_info.dart';

// 🔐 Auth Feature
import '../features/auth/data/datasource/auth_remote_datasource.dart';
import '../features/auth/data/repositories/auth_repository_impl.dart';
import '../features/auth/domain/repositories/auth_repository.dart';
import '../features/auth/domain/usecases/login_usecase.dart';
import '../features/auth/presentation/provider/auth_provider.dart';

// 📊 Dashboard Feature
import '../features/dashboard/data/datasource/dashboard_remote_datasource.dart';
import '../features/dashboard/data/repositories/dashboard_repository_impl.dart';
import '../features/dashboard/domain/repositories/dashboard_repository.dart';
import '../features/dashboard/domain/usecases/get_motor_status_usecase.dart';
import '../features/dashboard/presentation/provider/dashboard_provider.dart';

final providers = [

  // 📶 Network (GLOBAL)
  Provider<NetworkInfo>(create: (_) => NetworkInfo(Connectivity())),
  ChangeNotifierProvider(create: (_) => NetworkProvider()),

  // 🔐 AUTH FEATURE
  Provider<AuthRemoteDataSource>(
    create: (_) => AuthRemoteDataSource(),
  ),
  Provider<AuthRepository>(
    create: (context) => AuthRepositoryImpl(
      context.read<AuthRemoteDataSource>(),
    ),
  ),
  Provider<LoginUseCase>(
    create: (context) => LoginUseCase(
      context.read<AuthRepository>(),
    ),
  ),
  ChangeNotifierProvider<AuthProvider>(
    create: (context) => AuthProvider(
      context.read<LoginUseCase>(),
      context.read<NetworkInfo>(),
    ),
  ),

  // 📊 DASHBOARD FEATURE
  Provider<DashboardRemoteDataSource>(
    create: (_) => DashboardRemoteDataSource(),
  ),
  Provider<DashboardRepository>(
    create: (context) => DashboardRepositoryImpl(
      context.read<DashboardRemoteDataSource>(),
    ),
  ),
  Provider<GetMotorStatusUseCase>(
    create: (context) => GetMotorStatusUseCase(
      context.read<DashboardRepository>(),
    ),
  ),
  ChangeNotifierProvider<DashboardProvider>(
    create: (context) => DashboardProvider(
      context.read<GetMotorStatusUseCase>(),
      context.read<NetworkInfo>(), // 👈 ADD THIS
    ),
  ),

];

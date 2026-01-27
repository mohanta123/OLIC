import '../../data/models/login_response_model.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<LoginResponseModel> call(String username, String password) {
    return repository.login(username, password);
  }
}

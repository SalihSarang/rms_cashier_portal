import '../repositories/auth_repository.dart';

class SignOutCashier {
  final AuthRepository repository;

  SignOutCashier(this.repository);

  Future<void> call() async {
    return await repository.signOut();
  }
}

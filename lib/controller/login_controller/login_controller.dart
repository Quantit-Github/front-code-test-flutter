import 'package:riverpod/riverpod.dart';
import 'package:todobooks/config/storage_manager.dart';
import 'package:todobooks/repository/login_repository.dart';
import 'package:todobooks/top_level_providers.dart';

import 'login_state.dart';

final loginProvider =
    StateNotifierProvider<LoginStateNotifier, LoginState>((ref) {
  final loginRepo = ref.watch(loginRepositoryProvider);
  return LoginStateNotifier(loginRepository: loginRepo);
});

class LoginStateNotifier extends StateNotifier<LoginState> {
  LoginStateNotifier({required this.loginRepository})
      : super(const LoginState(loginStatus: LoginStatus.initial));

  final LoginRepository loginRepository;
  void onChangeEmail(String email) {
    state = state.copyWith(email: email);
  }

  void onChangePassword(String password) {
    state = state.copyWith(password: password);
  }

  Future<void> loginWithEmail() async {
    try {
      state = state.copyWith(loginStatus: LoginStatus.loading);
      final user = await loginRepository.login(
          userName: state.email, password: state.password);

      await PrefsManager.saveData("token", user.accessToken);
      await PrefsManager.saveData("refresh", user.refreshToken);

      state = state.copyWith(loginStatus: LoginStatus.success);
    } catch (e) {
      state = state.copyWith(
          errorMessage: e.toString(), loginStatus: LoginStatus.error);
    }
  }
}

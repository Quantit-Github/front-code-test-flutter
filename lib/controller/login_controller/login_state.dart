import 'package:equatable/equatable.dart';

enum LoginStatus { initial, loading, success, error }

class LoginState extends Equatable {
  final LoginStatus loginStatus;
  final String errorMessage;
  final String email;
  final String password;

  @override
  List<Object?> get props => [loginStatus, errorMessage, email, password];

  const LoginState({
    this.password = '',
    required this.loginStatus,
    this.errorMessage = '',
    this.email = '',
  });

  LoginState copyWith(
      {LoginStatus? loginStatus,
      String? errorMessage,
      String? email,
      String? accessToken,
      String? refreshToken,
      String? password}) {
    return LoginState(
      password: password ?? this.password,
      loginStatus: loginStatus ?? this.loginStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      email: email ?? this.email,
    );
  }
}

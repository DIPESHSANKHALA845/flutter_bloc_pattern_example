class LoginState {
  final bool obscureText;

  LoginState({this.obscureText = true});

  LoginState init() {
    return LoginState();
  }

  LoginState clone() {
    return LoginState();
  }

  LoginState copyWith({bool? obscureText}) {
    return LoginState(
      obscureText: obscureText ?? this.obscureText,
    );
  }
}

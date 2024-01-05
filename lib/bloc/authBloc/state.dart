abstract class AuthState {}

class AuthLoginLoadingState extends AuthState {}

class AuthLoginSuccessState extends AuthState {}

class AuthLoginErrorState extends AuthState {}

class AuthLoginInitState extends AuthState {}

class AuthRegisterLoadingState extends AuthState {}

class AuthRegisterSuccessState extends AuthState {}

class AuthRegisterErrorState extends AuthState {}

class ChangeState extends AuthState {}

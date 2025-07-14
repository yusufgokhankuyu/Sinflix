abstract class AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  LoginRequested(this.email, this.password);
}

class RegisterRequested extends AuthEvent {
  final String email;
  final String name;
  final String password;

  RegisterRequested({
    required this.email,
    required this.name,
    required this.password,
  });
}

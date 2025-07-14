class RegisterRequest {
  final String email;
  final String name;
  final String password;

  RegisterRequest({
    required this.email,
    required this.name,
    required this.password,
  });

  Map<String, String> toJson() => {
    'email': email,
    'name': name,
    'password': password,
  };
}

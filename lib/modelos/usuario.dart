
class Usuario {
  late String User;
  late String Password;

  Usuario({required this.User, required this.Password});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(User: json['User'], Password: json['Password']);
  }
}

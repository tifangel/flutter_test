class User {
  final int id;
  final String username;
  final String fullname;
  final String email;
  final String phone;
  final String avatar;

  const User({
    required this.id,
    required this.username,
    required this.fullname,
    required this.email,
    required this.phone,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      fullname: json['fullname'],
      email: json['email'],
      phone: json['phone'],
      avatar: json['avatar'],
    );
  }
}

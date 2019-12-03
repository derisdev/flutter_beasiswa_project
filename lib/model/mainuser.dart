class MainUser{
  User user;
  String token;

  MainUser({this.user, this.token});

  @override
  String toString() {
    return 'Github{user: $user, token: $token}';
  }

  factory MainUser.fromJson(Map<String, dynamic> json) {
    return MainUser(
      user: json["user"],
      token: json["token"],
    );
  }

}


class User{

  String name;
  String email;
  String password;

  User({this.name, this.email, this.password});

  @override
  String toString() {
    return 'User{username: $name, email: $email, password: $password}';
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json["name"],
      email: json["email"],
      password: json["password"]
    );
  }

}
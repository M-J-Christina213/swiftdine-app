import 'package:swiftdine_app/models/user.dart';

class AuthController {
  static final List<User> _users = [];

  static bool login(String email, String password) {
    return _users.any((user) => user.email == email && user.password == password);
  }

  static bool signup(String email, String password) {
    if (_users.any((user) => user.email == email)) return false;
    _users.add(User(email: email, password: password));
    return true;
  }
}

class AuthService {
  // Tài khoản mẫu
  final Map<String, String> _dummyUsers = {
    'trunglogarit': '260803', // Email: Mật khẩu
  };

  bool login(String email, String password) {
    if (_dummyUsers.containsKey(email) && _dummyUsers[email] == password) {
      return true; // Đăng nhập thành công
    }
    return false; // Đăng nhập thất bại
  }
}

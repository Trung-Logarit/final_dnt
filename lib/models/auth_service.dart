class AuthService {
  bool login(String email, String password) {
    // Đây chỉ là logic giả lập, thực tế cần tích hợp backend
    if (email == 'test@test.com' && password == '123456') {
      return true;
    }
    return false;
  }
}

import 'package:flutter/material.dart';
import 'package:taskly/reponsirory/auth_reponsitory.dart';

class AuthProvider extends ChangeNotifier {
  AuthReponsitory _authReponsitory = AuthReponsitory();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _message;
  String? get message => _message;
  Future<void> login(String username, String password) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _authReponsitory.login(username, password);
      await Future.delayed(Duration(seconds: 2));
      _message = 'Đăng nhâp thành công';
      _isLoading = false;
      notifyListeners();
      // Điều hướng vào màn hình Home
    } on FormatException catch (e) {
      _message = e.message;
      _isLoading = false;
      notifyListeners();
    }
  }
}

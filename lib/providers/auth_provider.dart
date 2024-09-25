import 'package:flutter/material.dart';
import 'package:project/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  String _token = '';

  bool get isAuthenticated => _isAuthenticated;

  Future<void> login(String username, String password) async {
    final result = await AuthService().login(username, password);

    if (result['success']) {
      _token = result['token'];
      _isAuthenticated = true;
    } else {
      _isAuthenticated = false;
      // Puedes manejar errores aquí
    }

    notifyListeners();
  }

  void logout() {
    _isAuthenticated = false;
    _token = '';
    notifyListeners();
  }
}

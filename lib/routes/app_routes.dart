import 'package:flutter/material.dart';
import 'package:project/screens/login/login.dart';

class AppRoutes {
  // Definición de las rutas como constantes
  static const String login = '/login';
  static const String home = '/home';
  static const String dashboard = '/dashboard';

  // Función para generar rutas según el nombre
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Página no encontrada: ${settings.name}'),
            ),
          ),
        );
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'http://localhost:8080/auth'; // Cambia por la URL de tu API

  Future<Map<String, dynamic>> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/login');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // La respuesta debería incluir el token JWT
      final Map<String, dynamic> body = jsonDecode(response.body);
      return {'success': true, 'token': body['token']};
    } else {
      return {'success': false, 'message': 'Invalid credentials'};
    }
  }
}

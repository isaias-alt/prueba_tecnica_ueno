import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:prueba_tecnica_ueno/models/user.dart';

class Api {
  static Future<List<User>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('https://reqres.in/api/users'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final userList = data['data'] as List;
        return userList.map((userData) => User.fromJson(userData)).toList();
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  static int generateRandomNumber() {
    final random = Random();
    return random.nextInt(100) + 1;
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:praktikum_uas/models/data_models.dart';

/// Membantu memuat data pengguna dari API Reqres.in.
class ApiServices {
  /// URL dasar API Reqres.in.
  final String _baseUrl = "https://reqres.in/api";

  /// Endpoint untuk memuat daftar pengguna.
  final String _usersEndpoint = "/users?page=2";

  /// Kunci API untuk akses gratis.
  final String _apiKey = "reqres-free-v1";

  /// Memuat daftar pengguna dari API Reqres.in.
  Future<List<User>> fetchUsers() async {
    final response = await http
        .get(
          Uri.parse('$_baseUrl$_usersEndpoint'),
          headers: {'Accept': 'application/json', 'x-api-key': _apiKey},
        )
        .timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['data'] as List).map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat pengguna: Status ${response.statusCode}');
    }
  }
}

class UserResponse {
  final int page; // Halaman saat ini dari data yang dimuat
  final int perPage; // Jumlah item per halaman
  final int total; // Total jumlah item
  final int totalPages; // Total jumlah halaman
  final List<User> data; // Daftar pengguna

  UserResponse({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  // Membuat instance UserResponse dari data JSON
  factory UserResponse.fromJson(Map<String, dynamic> json) {
    final List<User> users =
        (json['data'] as List<dynamic>)
            .map((e) => User.fromJson(e as Map<String, dynamic>))
            .toList();

    return UserResponse(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPages: json['total_pages'],
      data: users,
    );
  }
}

class User {
  final int id; // ID pengguna
  final String email; // Email pengguna
  final String firstName; // Nama depan pengguna
  final String lastName; // Nama belakang pengguna
  final String avatar; // URL avatar pengguna

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  // Membuat instance User dari data JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}

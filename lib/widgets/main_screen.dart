import 'package:flutter/material.dart';
import 'package:praktikum_uas/screens/home_page.dart';
import 'package:praktikum_uas/screens/porfile_page.dart';

/// Halaman utama yang menampilkan navigasi bottom
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  /// menampilkan halaman yang dipilih
  final List<Widget> _pages = [HomePage(), ProfilePage()];

  /// Fungsi untuk mengubah halaman
  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      /// tombol navigasi
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Home button
            TextButton.icon(
              icon: Icon(
                Icons.home,
                size: 30,
                color: _selectedIndex == 0 ? Colors.green : Colors.grey,
              ),
              label: Text(
                'Home',
                style: TextStyle(
                  color: _selectedIndex == 0 ? Colors.green : Colors.grey,
                ),
              ),
              onPressed: () => _onItemTapped(0),
            ),

            /// Profile button
            TextButton.icon(
              icon: Icon(
                Icons.person,
                size: 30,
                color: _selectedIndex == 1 ? Colors.green : Colors.grey,
              ),
              label: Text(
                'Profil',
                style: TextStyle(
                  color: _selectedIndex == 1 ? Colors.green : Colors.grey,
                ),
              ),
              onPressed: () => _onItemTapped(1),
            ),
          ],
        ),
      ),
    );
  }
}

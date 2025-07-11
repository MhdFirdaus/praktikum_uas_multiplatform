import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5F9),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profil yang di ambil dari github
              CircleAvatar(
                radius: 80,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/180175753?v=4',
                  ),
                  radius: 75,
                ),
              ),
              const SizedBox(height: 10),
              // text untuk nama
              const Text(
                'Muhammad Firdaus',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              // membuat card untuk menampilkan informasi pribadi
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // Menampilkan email
                      Row(
                        children: [
                          const Icon(Icons.person, size: 30),
                          const SizedBox(width: 10),
                          const Text(
                            'mhdfirdausf96@gmail.com',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Menampilkan nomor telepon
                      Row(
                        children: [
                          const Icon(Icons.phone, size: 30),
                          const SizedBox(width: 10),
                          const Text(
                            '082268913239',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Menampilkan data kampus
                      Row(
                        children: [
                          const Icon(Icons.school, size: 30),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              'Rekayasa Perangkat Lunak - Teknik Informatika - Politeknik Negeri Bengkalis',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      // Tombol untuk membuka GitHub
                      ElevatedButton.icon(
                        onPressed: () async {
                          final url = 'https://github.com/MhdFirdaus';
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Tidak dapat membuka GitHub'),
                              ),
                            );
                          }
                        },
                        icon: const Icon(Icons.open_in_browser),
                        label: const Text('Lihat saya di GitHub'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

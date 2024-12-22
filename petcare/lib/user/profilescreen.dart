import 'package:flutter/material.dart';
import 'package:petcare/login/loginpages.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF125587), // Latar belakang dengan warna solid
        child: Column(
          children: [
            const SizedBox(height: 10),
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 50, color: Colors.blue),
            ),
            const SizedBox(height: 10),
            const Text(
              'Profil',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 19),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextField('Nama Pengguna'),
                  const SizedBox(height: 15),
                  _buildTextField('Username'),
                  const SizedBox(height: 15),
                  _buildTextField('No Telpon'),
                ],
              ),
            ),
            // Tombol Save Profile
            ElevatedButton(
              onPressed: () {
                // Fungsi untuk menyimpan profil, bisa menambahkan aksi di sini
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Profil berhasil disimpan'),
                  backgroundColor: Colors.green),
                  
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF125587),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Simpan Profil'),
            ),
            const SizedBox(height: 10),
            // Tombol Logout dengan ikon
            IconButton(
              icon: const Icon(Icons.exit_to_app, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) => const LoginPages()),
                    (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuat TextField secara dinamis
  Widget _buildTextField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}

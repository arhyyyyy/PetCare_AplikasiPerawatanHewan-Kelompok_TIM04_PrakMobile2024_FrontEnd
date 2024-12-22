import 'package:flutter/material.dart';

class LupapaswordPages extends StatefulWidget {
  const LupapaswordPages({super.key});

  @override
  State<LupapaswordPages> createState() => _LupapaswordPagesState();
}

class _LupapaswordPagesState extends State<LupapaswordPages> {
  // Controller untuk inputan
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF125587),
        centerTitle: true,
        title: const Text(
          'Lupa Password',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: const Color(0xFF125587),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), // Tutup keyboard saat klik di luar input
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Ilustrasi gambar
                Center(
                  child: SizedBox(
                    height: 200,
                    child: Image.asset(
                      'assets/images/background.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Input username
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFF125587),
                    hintText: "Masukkan Nama (username)",
                    hintStyle: const TextStyle(color: Colors.white54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  ),
                ),
                const SizedBox(height: 20),
                // Input password baru
                TextField(
                  controller: _newPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFF125587),
                    hintText: 'Masukkan password baru',
                    hintStyle: const TextStyle(color: Colors.white54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  ),
                ),
                const SizedBox(height: 20),
                // Input konfirmasi password
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFF125587),
                    hintText: 'Konfirmasi password baru',
                    hintStyle: const TextStyle(color: Colors.white54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  ),
                ),
                const SizedBox(height: 20),
                // Tombol konfirmasi
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Validasi inputan
                      if (_usernameController.text.isEmpty ||
                          _newPasswordController.text.isEmpty ||
                          _confirmPasswordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Semua kolom harus diisi!',
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else if (_newPasswordController.text != _confirmPasswordController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Password dan konfirmasi password tidak cocok!',
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Password berhasil diubah',
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue[700],
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Konfirmasi'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

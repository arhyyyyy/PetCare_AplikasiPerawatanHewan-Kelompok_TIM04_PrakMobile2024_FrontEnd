import 'package:flutter/material.dart';

class TambahHewan extends StatelessWidget {
  const TambahHewan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF125587),
        title: const Text('PetCare', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: const Color(0xFF125587), 
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Tambahkan Hewan Peliharaan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Divider(color: Colors.white), // Divider untuk pemisah
            const SizedBox(height: 20),
            // Input nama hewan
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nama hewan',
                hintText: 'Masukkan nama hewan',
                labelStyle: TextStyle(color: Colors.black),
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Input jenis hewan
            const TextField(
              decoration: InputDecoration(
                labelText: 'Jenis hewan',
                hintText: 'Jenis hewan',
                labelStyle: TextStyle(color: Colors.black),
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Input ras hewan
            const TextField(
              decoration: InputDecoration(
                labelText: 'Ras',
                hintText: 'Ras',
                labelStyle: TextStyle(color: Colors.black),
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Input riwayat penyakit
            const TextField(
              decoration: InputDecoration(
                labelText: 'Riwayat Penyakit',
                hintText: 'Masukkan Riwayat Penyakit Jika Ada',
                labelStyle: TextStyle(color: Colors.black),
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Tombol simpan
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Data Hewan Berhasil ditambahkan'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue[700],
                  backgroundColor: Colors.white,
                ),
                child: const Text('Simpan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

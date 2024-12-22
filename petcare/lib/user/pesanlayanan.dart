import 'package:flutter/material.dart';

class LayananScreen extends StatelessWidget {
  const LayananScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF125587), // Latar belakang dengan warna solid
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 1, // Hanya ada 1 item untuk tanggal saya
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: Color(0xFF125587),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Jadwal Konsultasi',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '5 Desember 2024', // Tanggal tetap atau bisa dinamis sesuai kebutuhan
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Jam: 14:00', // Anda bisa mengganti jam sesuai kebutuhan
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Apakah Anda yakin ingin memilih jadwal ini?', // Deskripsi
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Layanan berhasil dikonfirmasi!'),
                              backgroundColor: Colors.green,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF125587),
                        ),
                        child: const Center(
                          child: Text(
                            'Konfirmasi',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // Kembali ke halaman sebelumnya
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF125587), // Bisa sesuaikan warnanya
                        ),
                        child: const Center(
                          child: Text(
                            'Kembali',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

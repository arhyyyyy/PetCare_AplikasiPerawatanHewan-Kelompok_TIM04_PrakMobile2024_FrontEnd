import 'package:flutter/material.dart';

class LihatHewan extends StatelessWidget {
  const LihatHewan({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar contoh hewan peliharaan (data sementara)
    final List<Map<String, String>> hewanList = [
      {
        'nama': 'Bella',
        'jenis': 'Kucing',
        'riwayat': 'Vaksin lengkap',
        'ras': 'Persia',
      },
      {
        'nama': 'Max',
        'jenis': 'Anjing',
        'riwayat': 'Alergi makanan',
        'ras': 'Golden Retriever',
      },
      {
        'nama': 'Luna',
        'jenis': 'Kucing',
        'riwayat': 'Sakit ginjal',
        'ras': 'Anggora',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF125587),
        title: const Text(
          'Daftar Hewan Peliharaan',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: const Color(0xFF125587),
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: hewanList.length,
          itemBuilder: (context, index) {
            final hewan = hewanList[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                title: Text(
                  hewan['nama']!,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Jenis: ${hewan['jenis']!}\nRas: ${hewan['ras']!}\nRiwayat: ${hewan['riwayat']!}',
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

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
      appBar: const _LihatHewanAppBar(),
      body: _HewanList(hewanList: hewanList),
    );
  }
}

class _LihatHewanAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _LihatHewanAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: const Color(0xFF125587),
      iconTheme: const IconThemeData(color: Colors.white),
      title: const Text(
        'Daftar Hewan Peliharaan',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HewanList extends StatelessWidget {
  final List<Map<String, String>> hewanList;

  const _HewanList({required this.hewanList});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF125587),
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: hewanList.length,
        itemBuilder: (context, index) {
          final hewan = hewanList[index];
          return _HewanCard(hewan: hewan);
        },
      ),
    );
  }
}

class _HewanCard extends StatelessWidget {
  final Map<String, String> hewan;

  const _HewanCard({required this.hewan});

  @override
  Widget build(BuildContext context) {
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
  }
}

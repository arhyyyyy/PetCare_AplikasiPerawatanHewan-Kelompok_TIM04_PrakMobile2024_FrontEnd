import 'package:flutter/material.dart';

class DataHewanPage extends StatefulWidget {
  const DataHewanPage({super.key});

  @override
  State<DataHewanPage> createState() => _DataHewanPageState();
}

class _DataHewanPageState extends State<DataHewanPage> {
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
    {
      'nama': 'Amba',
      'jenis': 'Kucing',
      'riwayat': 'Sakit ginjal',
      'ras': 'Anggora',
    },
  ];

  @override
  Widget build(BuildContext context) {
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
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    _confirmDelete(context, index);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Konfirmasi sebelum menghapus
  void _confirmDelete(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hapus Data'),
        content: const Text('Apakah Anda yakin ingin menghapus data ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                hewanList.removeAt(index);
              });
              Navigator.of(ctx).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Data berhasil dihapus'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text(
              'Hapus',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:petcare/admin/editjadwal.dart';

class JadwalAdmin {
  String tanggal;
  String nama;

  JadwalAdmin({required this.tanggal, required this.nama});
}

class JadwalAdminPage extends StatefulWidget {
  const JadwalAdminPage({super.key});

  @override
  _JadwalAdminPageState createState() => _JadwalAdminPageState();
}

class _JadwalAdminPageState extends State<JadwalAdminPage> {
  // List data dummy
  List<JadwalAdmin> jadwalList = [
    JadwalAdmin(tanggal: "5 Desember 2024", nama: "Imam Arfan"),
    JadwalAdmin(tanggal: "6 Desember 2024", nama: "Siti Rahma"),
    JadwalAdmin(tanggal: "7 Desember 2024", nama: "Ahmad Fauzi"),
  ];

  // Fungsi untuk menghapus data dengan konfirmasi
  void deleteJadwal(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: const Text('Apakah Anda yakin ingin menghapus jadwal ini?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  jadwalList.removeAt(index);
                });
                Navigator.of(context).pop(); // Menutup dialog
              },
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );
  }

  //navigasi ke halaman tambah/edit
  void navigateToForm({JadwalAdmin? jadwal, int? index}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          if (jadwal != null) {
            return EditJadwalPage(jadwal: jadwal);
          } else {
            return const TambahJadwalPage();
          }
        },
      ),
    );

    if (result != null) {
      setState(() {
        if (index != null) {
          jadwalList[index] = result;
        } else {
          jadwalList.add(result);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF125587), // Background utama
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF125587), // Warna AppBar
      ),
      body: ListView.builder(
        itemCount: jadwalList.length,
        itemBuilder: (context, index) {
          final jadwal = jadwalList[index];
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(Icons.calendar_today, color: Colors.blue),
              title: const Text(
                "Tanggal Konsultasi",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("${jadwal.tanggal}\n${jadwal.nama}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () => navigateToForm(jadwal: jadwal, index: index),
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    tooltip: "Edit Jadwal",
                  ),
                  IconButton(
                    onPressed: () => deleteJadwal(index),
                    icon: const Icon(Icons.delete, color: Colors.red),
                    tooltip: "Hapus Jadwal",
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () => navigateToForm(),
        child: const Icon(Icons.add, color: Color(0xFF125587)),
      ),
    );
  }
}

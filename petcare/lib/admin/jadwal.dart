import 'package:flutter/material.dart';
import 'package:petcare/admin/editjadwal.dart';

class JadwalAdmin {
  String tanggal;
  String nama;

  JadwalAdmin({required this.tanggal, required this.nama});
}

class JadwalAdminPage extends StatefulWidget {
  @override
  _JadwalAdminPageState createState() => _JadwalAdminPageState();
}

class _JadwalAdminPageState extends State<JadwalAdminPage> {
  // List data dummy
  List<JadwalAdmin> jadwalList = [
    JadwalAdmin(tanggal: "5 Desember 2024", nama: "Imam Arfan"),
    JadwalAdmin(tanggal: "5 Desember 2024", nama: "Imam Arfan"),
    JadwalAdmin(tanggal: "5 Desember 2024", nama: "Imam Arfan"),
  ];

  // Fungsi untuk menghapus data
  void deleteJadwal(int index) {
    setState(() {
      jadwalList.removeAt(index);
    });
  }

  // Fungsi untuk navigasi ke halaman tambah/edit
  void navigateToForm({JadwalAdmin? jadwal, int? index}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormJadwalPage(jadwal: jadwal),
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
      backgroundColor: Color(0xFF125587), // Background utama
      appBar: AppBar(
        title: Text("Jadwal"),
        backgroundColor: Color(0xFF125587), // Warna AppBar
      ),
      body: ListView.builder(
        itemCount: jadwalList.length,
        itemBuilder: (context, index) {
          final jadwal = jadwalList[index];
          return Card(
            color: Colors.white,
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.calendar_today, color: Colors.blue),
              title: Text("Tanggal Konsultasi", style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("${jadwal.tanggal}\n${jadwal.nama}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () => navigateToForm(jadwal: jadwal, index: index),
                    child: Text("Edit"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => deleteJadwal(index),
                    child: Text("Hapus"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
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
        child: Icon(Icons.add, color: Color(0xFF125587)),
      ),
    );
  }
}

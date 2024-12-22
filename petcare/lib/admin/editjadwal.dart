import 'package:flutter/material.dart';
import 'package:petcare/admin/jadwal.dart';

class FormJadwalPage extends StatefulWidget {
  final JadwalAdmin? jadwal;

  FormJadwalPage({this.jadwal});

  @override
  _FormJadwalPageState createState() => _FormJadwalPageState();
}

class _FormJadwalPageState extends State<FormJadwalPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tanggalController = TextEditingController();
  TextEditingController namaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.jadwal != null) {
      tanggalController.text = widget.jadwal!.tanggal;
      namaController.text = widget.jadwal!.nama;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF125587), // Warna background
      appBar: AppBar(
        title: Text(widget.jadwal == null ? "Tambah Jadwal" : "Edit Jadwal"),
        backgroundColor: Color(0xFF125587), // Sesuaikan warna AppBar jika perlu
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: tanggalController,
                decoration: InputDecoration(
                  labelText: "Tanggal Konsultasi",
                  filled: true, // Tambahkan ini agar warna latar belakang terlihat
                  fillColor: Colors.white, // Warna latar input
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Tanggal tidak boleh kosong";
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: namaController,
                decoration: InputDecoration(
                  labelText: "Nama",
                  filled: true,
                  fillColor: Colors.white, // Warna latar input
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Nama tidak boleh kosong";
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newJadwal = JadwalAdmin(
                      tanggal: tanggalController.text,
                      nama: namaController.text,
                    );
                    Navigator.pop(context, newJadwal);
                  }
                },
                child: Text(widget.jadwal == null ? "Tambah" : "Simpan"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xFF125587), backgroundColor: Colors.white, // Warna teks tombol
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

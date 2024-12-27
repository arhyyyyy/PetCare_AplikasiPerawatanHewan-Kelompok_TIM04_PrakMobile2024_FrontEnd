import 'package:flutter/material.dart';
import 'package:petcare/admin/jadwal.dart';
import 'package:intl/intl.dart'; // Untuk format tanggal

class TambahJadwalPage extends StatelessWidget {
  const TambahJadwalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return JadwalFormPage(
      title: "Tambah Jadwal",
      onSubmit: (jadwal) {
        Navigator.pop(context, jadwal);
      },
    );
  }
}

class EditJadwalPage extends StatelessWidget {
  final JadwalAdmin jadwal;

  const EditJadwalPage({super.key, required this.jadwal});

  @override
  Widget build(BuildContext context) {
    return JadwalFormPage(
      title: "Edit Jadwal",
      initialJadwal: jadwal,
      onSubmit: (updatedJadwal) {
        Navigator.pop(context, updatedJadwal);
      },
    );
  }
}

class JadwalFormPage extends StatefulWidget {
  final String title;
  final JadwalAdmin? initialJadwal;
  final Function(JadwalAdmin) onSubmit;

  const JadwalFormPage({
    super.key,
    required this.title,
    this.initialJadwal,
    required this.onSubmit,
  });

  @override
  _JadwalFormPageState createState() => _JadwalFormPageState();
}

class _JadwalFormPageState extends State<JadwalFormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController tanggalController;
  late TextEditingController namaController;

  @override
  void initState() {
    super.initState();
    tanggalController = TextEditingController(
      text: widget.initialJadwal?.tanggal ?? "",
    );
    namaController = TextEditingController(
      text: widget.initialJadwal?.nama ?? "",
    );
  }

  @override
  void dispose() {
    tanggalController.dispose();
    namaController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        tanggalController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF125587),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF125587),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildDatePicker(),
              const SizedBox(height: 10),
              _buildNamaField(),
              const SizedBox(height: 20),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  // Membuat widget untuk input tanggal
  Widget _buildDatePicker() {
    return TextFormField(
      controller: tanggalController,
      decoration: const InputDecoration(
        labelText: "Tanggal Konsultasi",
        filled: true,
        fillColor: Colors.white,
      ),
      readOnly: true, // Membuat field hanya dapat dibuka melalui kalender
      onTap: () => _selectDate(context),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Tanggal tidak boleh kosong";
        }
        return null;
      },
    );
  }

  // Membuat widget untuk input nama
  Widget _buildNamaField() {
    return TextFormField(
      controller: namaController,
      decoration: const InputDecoration(
        labelText: "Nama",
        filled: true,
        fillColor: Colors.white,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Nama tidak boleh kosong";
        }
        return null;
      },
    );
  }

  // Membuat tombol submit
  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          final newJadwal = JadwalAdmin(
            tanggal: tanggalController.text,
            nama: namaController.text,
          );
          widget.onSubmit(newJadwal);
        }
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color(0xFF125587),
        backgroundColor: Colors.white,
      ),
      child: Text(widget.title == "Tambah Jadwal" ? "Tambah" : "Simpan"),
    );
  }
}

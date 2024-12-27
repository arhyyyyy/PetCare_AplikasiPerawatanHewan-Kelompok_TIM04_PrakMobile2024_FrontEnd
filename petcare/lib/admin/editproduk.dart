import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';

class EditProdukPage extends StatefulWidget {
  final String namaProduk;
  final String hargaProduk;
  final String deskripsiProduk;
  final File? imageFile;

  const EditProdukPage({
    super.key,
    required this.namaProduk,
    required this.hargaProduk,
    required this.deskripsiProduk,
    this.imageFile,
  });

  @override
  State<EditProdukPage> createState() => _EditProdukPageState();
}

class _EditProdukPageState extends State<EditProdukPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _namaController;
  late TextEditingController _hargaController;
  late TextEditingController _deskripsiController;
  File? _imageFile;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: widget.namaProduk);
    _hargaController = TextEditingController(text: widget.hargaProduk);
    _deskripsiController = TextEditingController(text: widget.deskripsiProduk);
    _imageFile = widget.imageFile;
  }

  @override
  void dispose() {
    _namaController.dispose();
    _hargaController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      final updatedNama = _namaController.text;
      final updatedHarga = _hargaController.text;
      final updatedDeskripsi = _deskripsiController.text;

      Navigator.pop(context, {
        'nama': updatedNama,
        'harga': updatedHarga,
        'deskripsi': updatedDeskripsi,
        'image': _imageFile,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Edit Produk', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xFF125587),
      ),
      backgroundColor: const Color(0xFF125587),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField('Nama Produk', _namaController),
              const SizedBox(height: 10),
              _buildTextField('Harga Produk', _hargaController),
              const SizedBox(height: 10),
              _buildDeskripsiField(),
              const SizedBox(height: 20),
              _buildActionButtons(),
              const SizedBox(height: 10),
              if (_imageFile != null) _buildImagePreview(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk membuat TextFormField umum
  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white)),
        TextFormField(
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
          ),
          style: const TextStyle(color: Colors.black),
          keyboardType: label == 'Harga Produk'
              ? TextInputType.number
              : TextInputType.text, // Membatasi input untuk harga ke angka
          inputFormatters: label == 'Harga Produk'
              ? [FilteringTextInputFormatter.digitsOnly] // Hanya angka
              : null,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '$label tidak boleh kosong';
            }
            if (label == 'Harga Produk' && double.tryParse(value) == null) {
              return 'Masukkan angka yang valid';
            }
            return null;
          },
        ),
      ],
    );
  }

  // Widget untuk input deskripsi produk
  Widget _buildDeskripsiField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Deskripsi Produk', style: TextStyle(color: Colors.white)),
        TextFormField(
          controller: _deskripsiController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
          ),
          style: const TextStyle(color: Colors.black),
          maxLines: null,
          minLines: 5,
          keyboardType: TextInputType.multiline,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Deskripsi produk tidak boleh kosong';
            }
            return null;
          },
        ),
      ],
    );
  }

  // Widget untuk tombol aksi (Pilih Gambar, Simpan)
  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: _pickImage,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: const Text('Pilih Gambar Produk', style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: _saveChanges,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          child: const Text('Simpan Perubahan', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  // Widget untuk menampilkan gambar produk
  Widget _buildImagePreview() {
    return Image.file(
      _imageFile!,
      height: 150,
      width: 150,
      fit: BoxFit.cover,
    );
  }
}

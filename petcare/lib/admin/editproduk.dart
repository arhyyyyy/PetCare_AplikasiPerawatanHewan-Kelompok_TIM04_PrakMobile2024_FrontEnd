import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  // Fungsi untuk memilih gambar dari galeri atau kamera
  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery, // Atau ImageSource.camera untuk menggunakan kamera
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

      // Kirim data yang sudah diperbarui ke halaman sebelumnya
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
        title: const Text('Edit Produk',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: const Color(0xFF125587),
      ),
      backgroundColor: const Color(0xFF125587),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Nama Produk', style: TextStyle(color: Colors.white)),
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white), // White border
                  ),
                  filled: true,
                  fillColor: Color(0xFF125587), // Background color matching page
                ),
                style: const TextStyle(color: Colors.white), // Text color white
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama produk tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              const Text('Harga Produk', style: TextStyle(color: Colors.white)),
              TextFormField(
                controller: _hargaController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white), 
                  ),
                  filled: true,
                  fillColor: Color(0xFF125587), 
                ),
                style: const TextStyle(color: Colors.white), 
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harga produk tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              const Text('Deskripsi Produk', style: TextStyle(color: Colors.white)),
              TextFormField(
                controller: _deskripsiController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  filled: true,
                  fillColor: Color(0xFF125587),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Deskripsi produk tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Tombol untuk memilih gambar
                  ElevatedButton(
                    onPressed: _pickImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Tombol warna biru
                    ),
                    child: const Text('Pilih Gambar Produk',style: TextStyle(color: Colors.white),),
                  ),
                  const SizedBox(width: 10),
                  // Tombol Simpan Perubahan
                  ElevatedButton(
                    onPressed: _saveChanges,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Tombol warna hijau
                    ),
                    child: const Text('Simpan Perubahan',style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Menampilkan gambar yang dipilih (jika ada)
              if (_imageFile != null)
                Image.file(
                  _imageFile!,
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

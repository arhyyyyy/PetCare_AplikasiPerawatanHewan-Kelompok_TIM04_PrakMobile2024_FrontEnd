import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class TambahProdukPage extends StatefulWidget {
  const TambahProdukPage({super.key});

  @override
  State<TambahProdukPage> createState() => _TambahProdukPageState();
}

class _TambahProdukPageState extends State<TambahProdukPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  File? _imageFile; // Variabel untuk menyimpan gambar produk

  final ImagePicker _picker = ImagePicker();

  // Fungsi untuk memilih gambar
  Future<void> _pickImage({required ImageSource source}) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);

      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path); // Menyimpan gambar yang dipilih
        });
      }
    } catch (e) {
      // Menangani error jika terjadi masalah saat memilih gambar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal memilih gambar: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xFF125587), // Transparent untuk appbar
        elevation: 0, // Menghilangkan shadow appbar
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF125587), // Warna awal gradasi
              Colors.blue, // Warna akhir gradasi
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Nama Produk',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _namaController,
                  decoration: const InputDecoration(
                    hintText: 'Masukkan nama produk', hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // Border putih
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama produk tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  'Harga Produk',
                  style: TextStyle( color: Colors.white ,fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _hargaController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Masukkan harga produk',
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // Border putih
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harga produk tidak boleh kosong';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Masukkan harga yang valid';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  'Deskripsi Produk',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _deskripsiController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: 'Masukkan deskripsi produk',
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // Border putih
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Deskripsi produk tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                // Menyusun tombol di samping menggunakan Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Menambahkan tombol untuk memilih gambar dari galeri
                        _pickImage(source: ImageSource.gallery);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF125587),
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Tambah Gambar Produk',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Menyimpan data produk baru
                          final nama = _namaController.text;

                          // Tindakan untuk menambahkan produk ke dalam daftar (misalnya, update produk list)
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Produk $nama berhasil ditambahkan'),
                            ),
                          );

                          // Kembali ke halaman sebelumnya
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 28.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Tambah Produk', style: TextStyle(color: Colors.white, fontSize: 10)),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                // Menampilkan gambar yang dipilih
                if (_imageFile != null)
                  Image.file(
                    _imageFile!,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

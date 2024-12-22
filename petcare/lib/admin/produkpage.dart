import 'package:flutter/material.dart';
import 'package:petcare/admin/editproduk.dart';
import 'package:petcare/admin/tambahproduk.dart';

class ProdukPagesAdmin extends StatefulWidget {
  const ProdukPagesAdmin({super.key});

  @override
  State<ProdukPagesAdmin> createState() => _ProdukPagesAdminState();
}

class _ProdukPagesAdminState extends State<ProdukPagesAdmin> {
  final List<Map<String, String>> produkList = [
    {
      'nama': 'Cat food',
      'deskripsi': 'Makanan berkualitas tinggi untuk kucing',
      'harga': 'Rp.150.000',
      'gambar': 'assets/images/catfood.png', // Ganti dengan path gambar Anda
    },
    {
      'nama': 'Cat food',
      'deskripsi': 'Makanan berkualitas tinggi untuk kucing',
      'harga': 'Rp.150.000',
      'gambar': 'assets/images/catfood.png',
    },
    {
      'nama': 'Cat food',
      'deskripsi': 'Makanan berkualitas tinggi untuk kucing',
      'harga': 'Rp.150.000',
      'gambar': 'assets/images/catfood.png',
    },
    {
      'nama': 'Cat food',
      'deskripsi': 'Makanan berkualitas tinggi untuk kucing',
      'harga': 'Rp.150.000',
      'gambar': 'assets/images/catfood.png',
    },
  ];
  
  get existingImageFile => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF125587),
        title: const Text(
          'Produk',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFF125587),
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: produkList.length,
          itemBuilder: (context, index) {
            final produk = produkList[index];
            return Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(produk['gambar']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            produk['nama']!,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            produk['deskripsi']!,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            produk['harga']!,
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => EditProdukPage(
      namaProduk: produk['nama']!, // Mengirimkan data produk yang dipilih
      hargaProduk: produk['harga']!,
      deskripsiProduk: produk['deskripsi']!,
      imageFile: null, // Ganti dengan gambar yang sesuai jika ada
    ),
  ),
).then((updatedProduct) {
  if (updatedProduct != null) {
    // Update produk di produkList berdasarkan index yang dipilih
    setState(() {
      produkList[index] = {
        'nama': updatedProduct['nama'],
        'harga': updatedProduct['harga'],
        'deskripsi': updatedProduct['deskripsi'],
        'gambar': updatedProduct['image'] ?? produk['gambar'], // Menggunakan gambar lama jika tidak ada update
      };
    });
  }
});

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('edit',
                              style: TextStyle(fontSize: 12)),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            _confirmDelete(context, index);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('hapus',
                              style: TextStyle(fontSize: 12)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => const TambahProdukPage()));
        },
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }

  void _confirmDelete(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hapus Produk'),
        content: const Text('Apakah Anda yakin ingin menghapus produk ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                produkList.removeAt(index);
              });
              Navigator.of(ctx).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Produk berhasil dihapus'),
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

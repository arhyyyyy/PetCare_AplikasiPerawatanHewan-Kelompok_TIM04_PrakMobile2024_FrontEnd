import 'package:flutter/material.dart';

class ProdukPages extends StatelessWidget {
  const ProdukPages({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar produk
    final List<Map<String, dynamic>> produkList = [
      {
        "image": "assets/images/catfood.png", // Gambar makanan hewan
        "title": "Cat Food",
        "description": "Makanan berkualitas tinggi untuk kucing .",
        "price": "Rp 150.000",
      },
      {
        "image": "assets/images/dogfood.png", // Gambar layanan grooming
        "title": "Dog Food",
        "description": "Makanan Berkualitas Tinggi Untuk Anjing.",
        "price": "Rp 200.000",
      },
      {
        "image": "assets/images/dogGrooming.jpg", // Gambar mainan hewan
        "title": "Jasa Grooming",
        "description": "Jasa Grooming Untuk Hewan Tercinta Anda.",
        "price": "Rp 100.000",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Produk & Layanan",style:   TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF125587),
      ),
      body: Container(
        color: const Color(0xFF125587), // Latar belakang terang
        child: ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: produkList.length,
          itemBuilder: (context, index) {
            final produk = produkList[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.asset(
                      produk["image"],
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            produk["title"],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            produk["description"],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            produk["price"],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

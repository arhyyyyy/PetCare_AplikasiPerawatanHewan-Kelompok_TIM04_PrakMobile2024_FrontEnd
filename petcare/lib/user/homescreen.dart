import 'package:flutter/material.dart';
import 'package:petcare/user/jadwalscreen.dart';
import 'package:petcare/user/lihathewan.dart';
import 'package:petcare/user/produk.dart';
import 'package:petcare/user/profilescreen.dart';
import 'package:petcare/user/tambahhewan.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1; // Halaman Home sebagai default

  // Daftar halaman
  static const List<Widget> _pages = <Widget>[
    Jadwalscreen(), // Halaman Jadwal
    HomeScreenContent(), // Isi utama halaman Home
    ProfileScreen()// Halaman Profil
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Ubah halaman berdasarkan index yang dipilih
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt),
            label: 'Jadwal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10.0),
        color: const Color((0xFF125587)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Selamat Datang Di',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'PetCare',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/images/HomeScreen.png', // Pastikan gambar Anda tersedia di folder assets
              height: 300,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const TambahHewan()));
              },
              icon: const Icon(Icons.add),
              label: const Text(
                'Tambah Hewan Peliharaan',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const LihatHewan()));
              },
              icon: const Icon(Icons.remove_red_eye),
              label: const Text(
                'Melihat Data Hewan Peliharaan',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const ProdukPages()));
              },
              icon: const Icon(Icons.card_travel),
              label: const Text(
                'Lihat Produk Yang Ditawarkan',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

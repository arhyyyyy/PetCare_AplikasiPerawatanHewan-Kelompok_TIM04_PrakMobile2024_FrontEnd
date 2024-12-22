import 'package:flutter/material.dart';
import 'package:petcare/admin/datahewan.dart';
import 'package:petcare/admin/datauser.dart';
import 'package:petcare/admin/produkpage.dart';
import 'package:petcare/login/loginpages.dart';
import 'package:petcare/admin/jadwal.dart';

class HomeScreenAdmin extends StatelessWidget {
  const HomeScreenAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF125587),
      appBar: AppBar(
        title: const Text('PetCare', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF125587),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF125587),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white),
              ),
              padding: const EdgeInsets.all(20),
              child: const Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selamat Datang Di',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Home admin',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'PetCare',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/images/HomeScreen.png'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.all(20),
              children: [
                _buildMenuButton(
                  context,
                  title: 'Data User',
                  color: Colors.yellow,
                  icon: Icons.person,
                  page: const DataUserPage(),
                ),
                _buildMenuButton(
                  context,
                  title: 'Data Hewan',
                  color: Colors.orange,
                  icon: Icons.pets,
                  page: const DataHewanPage(),
                ),
                _buildMenuButton(
                  context,
                  title: 'Produk',
                  color: Colors.green,
                  icon: Icons.shopping_cart,
                  page: const ProdukPagesAdmin(),
                ),
                _buildMenuButton(
                  context,
                  title: 'Jadwal',
                  color: Colors.lightBlue,
                  icon: Icons.schedule,
                  page: JadwalAdminPage(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPages()),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blue,
                backgroundColor: Colors.white,
                side: const BorderSide(color: Colors.blue),
              ),
              child: const Text('Keluar'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: IconButton(
          onPressed: () {
            // Logika untuk tombol home
          },
          icon: const Icon(Icons.home, color: Colors.black, size: 45),
        ),
      ),
    );
  }

  Widget _buildMenuButton(
    BuildContext context, {
    required String title,
    required Color color,
    required IconData icon,
    required Widget page,
  }) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.white),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

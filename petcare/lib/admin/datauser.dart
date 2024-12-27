import 'package:flutter/material.dart';

class DataUserPage extends StatefulWidget {
  const DataUserPage({super.key});

  @override
  State<DataUserPage> createState() => _DataUserPageState();
}

class _DataUserPageState extends State<DataUserPage> {
  // Daftar pengguna (data sementara)
  final List<Map<String, String>> _penggunaList = [
    {'nama': 'John Doe', 'username': 'johndoe', 'no_telp': '081234567890'},
    {'nama': 'Jane Smith', 'username': 'janesmith', 'no_telp': '082345678901'},
    {'nama': 'Alice Johnson', 'username': 'alicej', 'no_telp': '083456789012'},
    {'nama': 'Bob Brown', 'username': 'bobby_brown', 'no_telp': '084567890123'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF125587),
      ),
      body: _buildUserList(),
    );
  }

  // Membangun daftar pengguna
  Widget _buildUserList() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF125587), Colors.blue],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: _penggunaList.length,
        itemBuilder: (context, index) {
          return _UserCard(
            pengguna: _penggunaList[index],
            onDelete: () => _confirmDelete(context, index),
          );
        },
      ),
    );
  }

  // Konfirmasi untuk menghapus pengguna
  void _confirmDelete(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hapus Data'),
        content: const Text('Apakah Anda yakin ingin menghapus data ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _penggunaList.removeAt(index);
              });
              Navigator.of(ctx).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Data berhasil dihapus'),
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

class _UserCard extends StatelessWidget {
  final Map<String, String> pengguna;
  final VoidCallback onDelete;

  const _UserCard({
    required this.pengguna,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shadowColor: Colors.black45,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(20.0),
        leading: CircleAvatar(
          backgroundColor: Colors.blueAccent,
          radius: 30,
          child: Text(
            pengguna['nama']![0],
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        title: Text(
          pengguna['nama']!,
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            _buildUserInfoRow(Icons.person, 'Username', pengguna['username']!),
            const SizedBox(height: 5),
            _buildUserInfoRow(Icons.phone, 'No. Tlp', pengguna['no_telp']!),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }

  // Widget untuk menampilkan informasi pengguna
  Widget _buildUserInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.black54),
        const SizedBox(width: 5),
        Flexible(
          child: Text(
            '$label: $value',
            style: const TextStyle(color: Colors.black54),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:petcare/user/pesanlayanan.dart';

class Jadwalscreen extends StatelessWidget {
  const Jadwalscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: JadwalList(),
    );
  }
}

class JadwalList extends StatelessWidget {
  const JadwalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF125587),
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: 3, // Ubah sesuai jumlah jadwal
        itemBuilder: (context, index) {
          return const JadwalCard();
        },
      ),
    );
  }
}

class JadwalCard extends StatelessWidget {
  const JadwalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              JadwalHeader(),
              SizedBox(height: 8),
              JadwalDate(),
              SizedBox(height: 8),
              JadwalInputField(),
              SizedBox(height: 12),
              JadwalButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class JadwalHeader extends StatelessWidget {
  const JadwalHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.calendar_today,
          color: Color(0xFF125587),
        ),
        SizedBox(width: 8),
        Text(
          'Tanggal Konsultasi',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class JadwalDate extends StatelessWidget {
  const JadwalDate({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      '5 Desember 2024',
      style: TextStyle(fontSize: 14, color: Colors.black54),
    );
  }
}

class JadwalInputField extends StatelessWidget {
  const JadwalInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Nama',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class JadwalButton extends StatelessWidget {
  const JadwalButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LayananScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF125587),
      ),
      child: const Center(
        child: Text(
          'Pilih',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

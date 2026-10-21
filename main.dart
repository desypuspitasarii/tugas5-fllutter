
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const Color warnaKampus = Color(0xFF0D7D4D);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kartu Ujian Mahasiswa',
      theme: ThemeData(
        colorSchemeSeed: warnaKampus,
        useMaterial3: true,
      ),
      home: const KartuUjianPage(),
    );
  }
}

class KartuUjianPage extends StatelessWidget {
  const KartuUjianPage({super.key});

  Widget barisJadwal(
    IconData ikon,
    String mataKuliah,
    String tanggal,
    String jam,
    String ruang,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(ikon, color: warnaKampus, size: 25),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mataKuliah,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 6),
                Text('Tanggal: $tanggal'),
                Text('Jam: $jam'),
                Text('Ruang: $ruang'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F3),
      appBar: AppBar(
        title: const Text(
          'Kartu Ujian Mahasiswa',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: warnaKampus,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // KARTU IDENTITAS MAHASISWA
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [warnaKampus, Color(0xFF159764)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.school,
                    color: Colors.white,
                    size: 42,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'UNIVERSITAS ISLAM KALIMANTAN',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const Text(
                    'MUHAMMAD ARSYAD AL BANJARI',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  const Divider(
                    color: Colors.white54,
                    height: 28,
                  ),
                  const CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.white,
                    child: Text(
                      'DS',
                      style: TextStyle(
                        color: warnaKampus,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'KARTU UJIAN MAHASISWA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _identitas('Nama', 'Desy Puspita Sari'),
                  _identitas('NPM', '2510020137'),
                  _identitas('Program Studi', 'Sistem Informasi'),
                  _identitas('Semester', '5'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Jadwal Ujian',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: warnaKampus,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Contoh jadwal — sesuaikan dengan jadwal kuliahmu.',
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
            const SizedBox(height: 14),

            // MINIMAL 4 MATA KULIAH
            barisJadwal(
              Icons.computer,
              'Pemrograman Mobile',
              '02 November 2026',
              '08.00 - 10.00',
              'Ruang A1',
            ),
            barisJadwal(
              Icons.storage,
              'Basis Data',
              '04 November 2026',
              '10.00 - 12.00',
              'Ruang A2',
            ),
            barisJadwal(
              Icons.analytics,
              'Analisis Sistem Informasi',
              '06 November 2026',
              '08.00 - 10.00',
              'Ruang B1',
            ),
            barisJadwal(
              Icons.language,
              'Pemrograman Web',
              '09 November 2026',
              '13.00 - 15.00',
              'Ruang B2',
            ),

            const SizedBox(height: 12),

            // TOMBOL CETAK KARTU
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Fitur cetak kartu masih berupa simulasi.',
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.print),
              label: const Text('Cetak Kartu'),
              style: ElevatedButton.styleFrom(
                backgroundColor: warnaKampus,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),

            // TOMBOL LIHAT SYARAT
            TextButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Syarat Mengikuti Ujian'),
                    content: const Text(
                      '1. Membawa kartu ujian.\n'
                      '2. Membawa kartu identitas mahasiswa.\n'
                      '3. Hadir tepat waktu.\n'
                      '4. Mematuhi tata tertib ujian.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Tutup'),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.info_outline),
              label: const Text('Lihat Syarat'),
            ),

            const SizedBox(height: 12),
            const Center(
              child: Text(
                'Tugas Mandiri 5 - Pemrograman Mobile',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _identitas(String label, String nilai) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 105,
            child: Text(
              label,
              style: const TextStyle(color: Colors.white70),
            ),
          ),
          const Text(
            ': ',
            style: TextStyle(color: Colors.white),
          ),
          Expanded(
            child: Text(
              nilai,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

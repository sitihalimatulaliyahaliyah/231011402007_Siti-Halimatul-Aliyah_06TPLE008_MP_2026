import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Workshop Kegiatan Kampus',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.pinkAccent,
      ),
      home: const WorkshopPage(),
    );
  }
}

class WorkshopPage extends StatelessWidget {
  const WorkshopPage({super.key});

  // Data Kursus Berbeda untuk memenuhi syarat Soal 2
  final List<Map<String, String>> workshopData = const [
    {
      'judul': 'Creative Workshop: Flutter & UI Design',
      'tanggal': '20 Mei 2026',
      'lokasi': 'Lab Komputer, Gedung Teknik',
      'kuota': '15 Orang',
    },
    {
      'judul': 'Web Development Beginner: Html,Css,Js',
      'tanggal': '22 Mei 2026',
      'lokasi': 'Ruang Seminar, Gedung A',
      'kuota': '10 Orang',
    },
    {
      'judul': 'Data Science: Python for Beginner',
      'tanggal': '25 Mei 2026',
      'lokasi': 'Auditiorium Utama',
      'kuota': '5 Orang',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDE7),
      appBar: AppBar(
        title: const Text(
          'Workshop Kampus',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink[400],
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        itemCount: workshopData.length, // Menampilkan 3 kursus sesuai isi data
        itemBuilder: (context, index) {
          // Mengambil data spesifik per index
          final item = workshopData[index];

          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 20),
            shadowColor: Colors.pink.withValues(alpha: 0.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Colors.pink[100]!, width: 1),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1. Judul Workshop Dinamis
                    Text(
                      item['judul']!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink[800],
                      ),
                    ),
                    const SizedBox(height: 12),

                    Divider(height: 1, thickness: 2, color: Colors.amber[100]),
                    const SizedBox(height: 16),

                    // 2. Tanggal Dinamis
                    _buildInfoRow(Icons.calendar_month, item['tanggal']!, Colors.amber[700]!),

                    const SizedBox(height: 8),

                    // 3. Lokasi Dinamis
                    _buildInfoRow(Icons.map_rounded, item['lokasi']!, Colors.pink[300]!),

                    const SizedBox(height: 8),

                    // 4. Kuota Dinamis
                    Row(
                      children: [
                        Icon(Icons.person_pin, size: 20, color: Colors.pink[300]),
                        const SizedBox(width: 10),
                        const Text('Sisa Kuota: '),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.amber[400],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            item['kuota']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // 5. Tombol Daftar
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink[400],
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 3,
                        ),
                        child: const Text(
                          'DAFTAR SEKARANG',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text, Color iconColor) {
    return Row(
      children: [
        Icon(icon, size: 20, color: iconColor),
        const SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
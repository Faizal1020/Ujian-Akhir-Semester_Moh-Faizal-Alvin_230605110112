import 'package:flutter/material.dart';
import '../config/colors.dart';
import '../data/models/budaya_model.dart';
import 'penyewaan_page.dart';

class DetailPage extends StatelessWidget {
  final BudayaItem item;

  const DetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: Text(item.nama)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // GAMBAR UTAMA
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(item.gambar),
            ),

            const SizedBox(height: 20),

            Text(
              item.nama,
              style: const TextStyle(
                color: AppColors.textDark,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              item.deskripsi,
              style: const TextStyle(fontSize: 15, color: AppColors.textLight),
            ),

            const SizedBox(height: 20),

            const Text(
              "Sejarah",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.textDark,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              item.sejarah,
              style: const TextStyle(fontSize: 15, color: AppColors.textLight),
            ),

            const SizedBox(height: 30),

            // TOMBOL KE PENYEWAAN
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PenyewaanPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Lihat Penyewaan",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

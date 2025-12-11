import 'package:flutter/material.dart';
import '../config/colors.dart';
import '../data/repository/budaya_repository.dart';
import '../data/models/penyewaan_model.dart';

class PenyewaanDetailPage extends StatefulWidget {
  final int id;

  const PenyewaanDetailPage({super.key, required this.id});

  @override
  State<PenyewaanDetailPage> createState() => _PenyewaanDetailPageState();
}

class _PenyewaanDetailPageState extends State<PenyewaanDetailPage> {
  late Future<List<PenyewaanDetail>> futureDetail;

  @override
  void initState() {
    super.initState();
    futureDetail = BudayaRepository.getPenyewaanDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text("Detail Penyewaan")),
      body: FutureBuilder<List<PenyewaanDetail>>(
        future: futureDetail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Data penyewaan tidak ditemukan"));
          }

          final detailList = snapshot.data!;
          final detail = detailList.firstWhere(
            (e) => e.id == widget.id,
            orElse: () => detailList.first,
          );

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NAMA
                Text(
                  detail.nama,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),

                const SizedBox(height: 20),

                // LIST BARANG
                const Text(
                  "Barang yang Disewakan",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),

                const SizedBox(height: 10),

                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: detail.barang
                      .map(
                        (b) => Chip(
                          label: Text(b),
                          backgroundColor: AppColors.secondary,
                        ),
                      )
                      .toList(),
                ),

                const SizedBox(height: 20),

                // HARGA
                Text(
                  "Harga: ${detail.harga}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.textDark,
                  ),
                ),

                const SizedBox(height: 20),

                // DESKRIPSI
                const Text(
                  "Deskripsi",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.textDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  detail.deskripsi,
                  style: const TextStyle(
                    fontSize: 15,
                    color: AppColors.textLight,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 20),

                // LOKASI & KONTAK
                Row(
                  children: [
                    Icon(Icons.location_on, color: AppColors.primary),
                    const SizedBox(width: 8),
                    Expanded(child: Text(detail.lokasi)),
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    Icon(Icons.phone, color: AppColors.primary),
                    const SizedBox(width: 8),
                    Expanded(child: Text(detail.kontak)),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../config/colors.dart';
import '../data/repository/budaya_repository.dart';
import '../data/models/penyewaan_model.dart';
import 'penyewaan_detail_page.dart';

class PenyewaanPage extends StatefulWidget {
  const PenyewaanPage({super.key});

  @override
  State<PenyewaanPage> createState() => _PenyewaanPageState();
}

class _PenyewaanPageState extends State<PenyewaanPage> {
  late Future<List<Penyewaan>> penyewaanFuture;

  @override
  void initState() {
    super.initState();
    penyewaanFuture = BudayaRepository.getPenyewaan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text("Rekomendasi Penyewaan")),
      body: FutureBuilder<List<Penyewaan>>(
        future: penyewaanFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text("Error: ${snapshot.error}"),
                ],
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Tidak ada data penyewaan"));
          }

          final data = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: data.length,
            itemBuilder: (context, i) {
              final item = data[i];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (c) => PenyewaanDetailPage(id: item.id),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // ICON
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(Icons.store, color: AppColors.textDark),
                      ),

                      const SizedBox(width: 16),

                      // TEXT
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.nama,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textDark,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.kategori,
                              style: const TextStyle(
                                color: AppColors.textLight,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "${item.lokasi} • ${item.hargaMulai}",
                              style: const TextStyle(
                                color: AppColors.textLight,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // RATING
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const SizedBox(width: 4),
                          Text(
                            item.rating.toString(),
                            style: const TextStyle(
                              color: AppColors.textDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

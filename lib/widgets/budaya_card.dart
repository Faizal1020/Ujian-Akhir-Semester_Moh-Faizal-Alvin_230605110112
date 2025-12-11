import 'package:flutter/material.dart';
import '../data/models/budaya_model.dart';
import '../config/colors.dart';

class BudayaCard extends StatelessWidget {
  final BudayaItem item;
  final VoidCallback onTap;

  const BudayaCard({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // GAMBAR
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                item.gambar,
                width: 85,
                height: 85,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 14),

            // TEKS
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.nama,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item.kategori,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textLight,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

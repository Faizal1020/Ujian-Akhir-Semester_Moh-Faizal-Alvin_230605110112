import 'package:flutter/material.dart';
import '../config/colors.dart';

class CategoryFilter extends StatelessWidget {
  final String selected;
  final Function(String) onSelected;

  const CategoryFilter({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final List<String> categories = const [
    "Semua",
    "Tari",
    "Alat Musik",
    "Pakaian Adat",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        children: categories.map((cat) {
          final isSelected = selected == cat;

          return GestureDetector(
            onTap: () => onSelected(cat),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.card,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.border),
              ),
              alignment: Alignment.center,
              child: Text(
                cat,
                style: TextStyle(
                  color: isSelected ? Colors.white : AppColors.textDark,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

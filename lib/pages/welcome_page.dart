import 'package:flutter/material.dart';
import '../config/colors.dart';
import 'home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // LOGO / GAMBAR
            Image.asset(
              "assets/logo.png", // tambahkan nanti
              height: 180,
            ),

            const SizedBox(height: 30),

            Text(
              "Eksplor Budaya Jawa",
              style: TextStyle(
                color: AppColors.textDark,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              "Pelajari Seni, Tari, Musik, dan Tradisinya",
              style: TextStyle(color: AppColors.textLight, fontSize: 14),
            ),

            const SizedBox(height: 40),

            // TOMBOL MULAI
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (c) => const HomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 40,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text("Mulai", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

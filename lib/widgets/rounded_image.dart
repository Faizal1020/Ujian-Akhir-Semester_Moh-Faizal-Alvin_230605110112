import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final String url;
  final double size;

  const RoundedImage({super.key, required this.url, this.size = 100});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 2),
      child: Image.network(url, width: size, height: size, fit: BoxFit.cover),
    );
  }
}

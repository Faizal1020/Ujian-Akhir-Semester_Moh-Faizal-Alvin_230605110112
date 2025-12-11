class Formatter {
  // Format harga → "Rp 150.000"
  static String formatRupiah(String harga) {
    return harga.replaceAll("Rp", "Rp ");
  }

  // Kapital setiap kata
  static String capitalize(String text) {
    return text
        .split(" ")
        .map((w) {
          if (w.isEmpty) return w;
          return w[0].toUpperCase() + w.substring(1).toLowerCase();
        })
        .join(" ");
  }

  // Potong teks terlalu panjang
  static String shorten(String text, int length) {
    if (text.length <= length) return text;
    return text.substring(0, length) + "...";
  }
}

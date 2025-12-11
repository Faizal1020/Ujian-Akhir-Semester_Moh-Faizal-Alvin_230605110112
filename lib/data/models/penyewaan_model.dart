class Penyewaan {
  final int id;
  final String nama;
  final String kategori;
  final String lokasi;
  final String hargaMulai;
  final String kontak;
  final double rating;

  Penyewaan({
    required this.id,
    required this.nama,
    required this.kategori,
    required this.lokasi,
    required this.hargaMulai,
    required this.kontak,
    required this.rating,
  });

  factory Penyewaan.fromJson(Map<String, dynamic> json) {
    return Penyewaan(
      id: json["id"],
      nama: json["nama"],
      kategori: json["kategori"],
      lokasi: json["lokasi"],
      hargaMulai: json["harga_mulai"],
      kontak: json["kontak"],
      rating: (json["rating"] ?? 0).toDouble(),
    );
  }
}

class PenyewaanDetail {
  final int id;
  final String nama;
  final List<String> barang;
  final String harga;
  final String deskripsi;
  final String lokasi;
  final String kontak;

  PenyewaanDetail({
    required this.id,
    required this.nama,
    required this.barang,
    required this.harga,
    required this.deskripsi,
    required this.lokasi,
    required this.kontak,
  });

  factory PenyewaanDetail.fromJson(Map<String, dynamic> json) {
    return PenyewaanDetail(
      id: json["id"],
      nama: json["nama"],
      barang: List<String>.from(json["barang"]),
      harga: json["harga"],
      deskripsi: json["deskripsi"],
      lokasi: json["lokasi"],
      kontak: json["kontak"],
    );
  }
}

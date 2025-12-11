class BudayaItem {
  final int id;
  final String nama;
  final String gambar;
  final String deskripsi;
  final String sejarah;
  final String kategori;

  BudayaItem({
    required this.id,
    required this.nama,
    required this.gambar,
    required this.deskripsi,
    required this.sejarah,
    required this.kategori,
  });

  factory BudayaItem.fromJson(Map<String, dynamic> json, String kategori) {
    return BudayaItem(
      id: json["id"],
      nama: json["nama"],
      gambar: json["gambar"],
      deskripsi: json["deskripsi"],
      sejarah: json["sejarah"],
      kategori: kategori,
    );
  }
}

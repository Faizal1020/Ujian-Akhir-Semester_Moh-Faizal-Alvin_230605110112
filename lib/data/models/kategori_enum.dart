enum KategoriBudaya { tari, alatMusik, pakaianAdat }

String kategoriToString(KategoriBudaya kategori) {
  switch (kategori) {
    case KategoriBudaya.tari:
      return "Tari";
    case KategoriBudaya.alatMusik:
      return "Alat Musik";
    case KategoriBudaya.pakaianAdat:
      return "Pakaian Adat";
  }
}

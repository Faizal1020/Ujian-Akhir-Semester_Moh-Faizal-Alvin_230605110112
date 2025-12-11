import 'package:budaya_app/data/budaya_api.dart';
import 'package:budaya_app/data/models/budaya_model.dart';
import 'package:budaya_app/data/models/penyewaan_model.dart';

class BudayaRepository {
  // Ambil semua data dari API
  static Future<Map<String, dynamic>> _fetchRaw() async {
    return await BudayaAPI.getBudayaData();
  }

  // ---------------------------------------------
  // GET LIST TARI
  // ---------------------------------------------
  static Future<List<BudayaItem>> getTari() async {
    final raw = await _fetchRaw();
    return (raw["tari"] as List)
        .map((e) => BudayaItem.fromJson(e, "Tari"))
        .toList();
  }

  // ---------------------------------------------
  // GET LIST ALAT MUSIK
  // ---------------------------------------------
  static Future<List<BudayaItem>> getAlatMusik() async {
    final raw = await _fetchRaw();
    return (raw["alat_musik"] as List)
        .map((e) => BudayaItem.fromJson(e, "Alat Musik"))
        .toList();
  }

  // ---------------------------------------------
  // GET LIST PAKAIAN ADAT
  // ---------------------------------------------
  static Future<List<BudayaItem>> getPakaianAdat() async {
    final raw = await _fetchRaw();
    return (raw["pakaian_adat"] as List)
        .map((e) => BudayaItem.fromJson(e, "Pakaian Adat"))
        .toList();
  }

  // ---------------------------------------------
  // GET PENYEWAAN
  // ---------------------------------------------
  static Future<List<Penyewaan>> getPenyewaan() async {
    final raw = await _fetchRaw();
    return (raw["penyewaan"] as List)
        .map((e) => Penyewaan.fromJson(e))
        .toList();
  }

  // ---------------------------------------------
  // GET PENYEWAAN DETAIL
  // ---------------------------------------------
  static Future<List<PenyewaanDetail>> getPenyewaanDetail() async {
    final raw = await _fetchRaw();
    return (raw["penyewaan_detail"] as List)
        .map((e) => PenyewaanDetail.fromJson(e))
        .toList();
  }
}

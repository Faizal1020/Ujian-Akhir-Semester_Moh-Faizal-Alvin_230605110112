import 'dart:convert';
import 'package:http/http.dart' as http;

class BudayaAPI {
  static const String apiUrl =
      "https://vercel-upload-wbcoji9ew-faizalvs-projects.vercel.app/budaya.json";

  static Future<Map<String, dynamic>> getBudayaData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Gagal mengambil data dari API");
    }
  }
}

import 'package:flutter/material.dart';
import '../config/colors.dart';
import '../widgets/search_bar.dart';
import '../widgets/category_filter.dart';
import '../widgets/budaya_card.dart';
import '../data/repository/budaya_repository.dart';
import '../data/models/budaya_model.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BudayaItem> allData = [];
  List<BudayaItem> filteredData = [];
  String selectedCategory = "Semua";
  String searchQuery = "";

  late Future<List<BudayaItem>> dataFuture;

  @override
  void initState() {
    super.initState();
    dataFuture = loadAllData();
  }

  Future<List<BudayaItem>> loadAllData() async {
    final tari = await BudayaRepository.getTari();
    final alat = await BudayaRepository.getAlatMusik();
    final pakaian = await BudayaRepository.getPakaianAdat();

    return [...tari, ...alat, ...pakaian];
  }

  void applyFilter() {
    setState(() {
      filteredData = allData.where((i) {
        final matchCategory =
            selectedCategory == "Semua" || i.kategori == selectedCategory;
        final matchSearch = i.nama.toLowerCase().contains(
          searchQuery.toLowerCase(),
        );

        return matchCategory && matchSearch;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text("Budaya Jawa"), elevation: 0),
      body: FutureBuilder<List<BudayaItem>>(
        future: dataFuture,
        builder: (context, snapshot) {
          // LOADING STATE
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // ERROR STATE
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text("Error: ${snapshot.error}", textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        dataFuture = loadAllData();
                      });
                    },
                    child: const Text("Coba Lagi"),
                  ),
                ],
              ),
            );
          }

          // SUCCESS STATE
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Tidak ada data ditemukan"));
          }

          // Set allData when data is loaded
          allData = snapshot.data!;
          if (filteredData.isEmpty) {
            filteredData = allData;
          }

          return Column(
            children: [
              // SEARCH BAR
              SearchBarWidget(
                onChanged: (value) {
                  searchQuery = value;
                  applyFilter();
                },
              ),

              // FILTER
              CategoryFilter(
                selected: selectedCategory,
                onSelected: (value) {
                  selectedCategory = value;
                  applyFilter();
                },
              ),

              // LIST DATA
              Expanded(
                child: filteredData.isEmpty
                    ? const Center(
                        child: Text(
                          "Tidak ada data ditemukan",
                          style: TextStyle(
                            color: AppColors.textDark,
                            fontSize: 16,
                          ),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: filteredData.length,
                        itemBuilder: (context, i) {
                          final item = filteredData[i];

                          return BudayaCard(
                            item: item,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (c) => DetailPage(item: item),
                                ),
                              );
                            },
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}

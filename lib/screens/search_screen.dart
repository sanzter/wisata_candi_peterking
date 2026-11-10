import 'package:flutter/material.dart';
import 'package:wisata_candi/data/candi_data.dart';
import 'package:wisata_candi/models/candi.dart';
import 'package:wisata_candi/screens/detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // todo 1: buat variabel yang dibutuhkan
  List<Candi> _filteredCandis = candiList;
  String _searchQuery = "";
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // todo 2: buat appbar dengan judul pencarian candi
      appBar: AppBar(title: const Text('Pencarian Candi')),
      // todo 3: buat body berupa column
      body: Column(
        children: [
          // todo 4: buat textfield pencarian sebagai anak dari column
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.deepPurple[50],
              ),
              child: TextField(
                controller: _searchController,
                autofocus: false,
                // todo 6: implementasi fitur pencarian
                onChanged: (String value) {
                  setState(() {
                    _searchQuery = value;
                    _filteredCandis = candiList
                        .where((Candi candi) => candi.name
                            .toLowerCase()
                            .contains(_searchQuery.toLowerCase()))
                        .toList();
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Cari candi ...',
                  prefixIcon: const Icon(Icons.search),
                  // todo 7: implementasi pengosongan input
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              _searchQuery = '';
                              _filteredCandis = candiList;
                              _searchController.clear();
                            });
                          },
                          icon: const Icon(Icons.clear),
                        )
                      : const SizedBox(),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Colors.deepPurple),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          ),

          // todo 5: buat listview hasil pencarian sebagai anak dari column
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCandis.length,
              itemBuilder: (context, index) {
                final candi = _filteredCandis[index];
                // todo 8: implementasi GestureDetector dan Hero animation
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(candi: candi),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          width: 100,
                          height: 100,
                          child: Hero(
                            tag: candi.imageAsset,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                candi.imageAsset,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                candi.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(candi.location),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
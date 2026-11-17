import 'package:flutter/material.dart';
import 'package:wisata_candi/models/candi.dart';

class ItemCard extends StatelessWidget {
  final Candi candi;
  const new({super.key, required this.candi});
  //TODO 1: Buat variable

  @override
  Widget build(BuildContext context) {
    //TODO 6: Routing ke DetailScreen
    return Card(
      //TODO 2: Set parameter shape, margin, dan elevation
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(4),
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //TODO 3: Image Widget
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                candi.imageAsset,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          //TODO 4: Text Widget(nama candi)
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: Text(
              candi.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          //TODO 5: Text Widget(type candi)
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: Text(candi.type, style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}

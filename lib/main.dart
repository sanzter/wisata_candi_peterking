import 'package:flutter/material.dart';
import 'package:wisata_candi/data/candi_data.dart';
import 'package:wisata_candi/screens/detail_screen.dart';
<<<<<<< HEAD
import 'package:wisata_candi/screens/profile_screen.dart';
import 'package:wisata_candi/screens/search_screen.dart';
=======

>>>>>>> 0596c3e9ce52c8ea8c0a2c0abb13913dac1ceb94

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
<<<<<<< HEAD
  const new({super.key});
=======
  const MyApp({super.key});
>>>>>>> 0596c3e9ce52c8ea8c0a2c0abb13913dac1ceb94

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
<<<<<<< HEAD
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      //home: DetailScreen(candi: candiList[5]),
      //home: ProfileScreen(),
      home: SearchScreen()
    );
  }
}
=======
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DetailScreen(candi: candiList[0]),
    );
  }

}
>>>>>>> 0596c3e9ce52c8ea8c0a2c0abb13913dac1ceb94

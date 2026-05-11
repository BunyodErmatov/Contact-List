import 'package:flutter/material.dart';
import 'package:foydalanuvchilar_ruyxati/widgets/foydalanuvchi_qismi.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FoydalanuvchilarRuyxati(),
      theme: ThemeData(fontFamily: "StyleScript"),
    );
  }
}

class FoydalanuvchilarRuyxati extends StatefulWidget {
  const FoydalanuvchilarRuyxati({super.key});

  @override
  State<FoydalanuvchilarRuyxati> createState() =>
      _FoydalanuvchilarRuyxatiState();
}

class _FoydalanuvchilarRuyxatiState extends State<FoydalanuvchilarRuyxati> {
  List<Map<String, String>> foydalanuvchilar = [
    {
      "id": "user1",
      "ismi": "Ann Neal",
      "telefon": "322-122-6767",
      "rasmi": "https://picsum.photos/30",
    },
    {
      "id": "user2",
      "ismi": "Davron Kabulov",
      "telefon": "212-900-6767",
      "rasmi": "https://picsum.photos/40",
    },
    {
      "id": "user3",
      "ismi": "Eva Braun",
      "telefon": "016-413-6767",
      "rasmi": "https://picsum.photos/50",
    },
    {
      "id": "user4",
      "ismi": "Eldor Ergashov",
      "telefon": "743-125-6767",
      "rasmi": "https://picsum.photos/60",
    },
  ];

  void foydalanuvchiniUchrish(String foydalanuvchiID) {
    setState(() {
      foydalanuvchilar.removeWhere(
        (foydalanuvchi) {
          return foydalanuvchi['id'] == foydalanuvchiID;
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Foydalanuvchilar Ro'yxati")),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Foydalanuvchilar Ro'yxati",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                itemExtent: 90,
                children: foydalanuvchilar
                    .map(
                      (foydalanuvchi) => FoydalanuvchiQismi(
                        id: foydalanuvchi['id']!,
                        ismi: foydalanuvchi['ismi']!,
                        telefon: foydalanuvchi['telefon']!,
                        imageUrl: foydalanuvchi['rasmi']!,
                        foydalanuvchiUchrish: foydalanuvchiniUchrish,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.search),
      ),
    );
  }
}

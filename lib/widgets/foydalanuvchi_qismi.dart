import 'package:flutter/material.dart';

class FoydalanuvchiQismi extends StatelessWidget {
  final String id;
  final String ismi;
  final String telefon;
  final String imageUrl;
  final Function foydalanuvchiUchrish;

  const FoydalanuvchiQismi({
    required this.id,
    required this.ismi,
    required this.telefon,
    required this.imageUrl,
    required this.foydalanuvchiUchrish,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: Center(
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              imageUrl,
            ),
          ),
          title: Text(
            ismi,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(telefon),
          trailing: IconButton(
            onPressed: () {
              foydalanuvchiUchrish(id);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}

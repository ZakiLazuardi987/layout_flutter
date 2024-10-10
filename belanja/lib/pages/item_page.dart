import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';
import 'package:go_router/go_router.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Ambil argument yang dikirim dari halaman sebelumnya (HomePage)
    final itemArgs = GoRouterState.of(context).extra as Item;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.blue,
        title: Text(itemArgs.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Tampilkan gambar produk
            Center(
              child: Hero(
                tag: 'itemImage-${itemArgs.name}', // Sama seperti tag di HomePage
                child: Image.network(
                  itemArgs.image,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'Name: ${itemArgs.name}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'Price: Rp ${itemArgs.price}',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'Stock: ${itemArgs.stock}',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),
            // Tambahkan Center di sini untuk rating
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min, // Agar row mengikuti konten
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 24),
                  Text(
                    '${itemArgs.rating}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int jumlah = 1;

  void tambahJumlah() {
    if (jumlah < widget.product.stock) {
      setState(() {
        jumlah++;
      });
    }
  }

  void kurangiJumlah() {
    if (jumlah > 1) {
      setState(() {
        jumlah--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar produk
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.shopping_bag,
                size: 120,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 20),

            // Nama produk
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // Harga
            Text(
              'Rp${product.price.toStringAsFixed(0)}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 16),

            // Informasi produk
            Row(
              children: [
                const Icon(Icons.category, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Kategori: ${product.category}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(Icons.inventory_2, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Stok: ${product.stock}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(Icons.info_outline, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Status: ${product.getStatusStok()}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Deskripsi
            const Text(
              'Deskripsi Produk',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              product.description ?? 'Tidak ada deskripsi',
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 24),

            // Pilih jumlah
            const Text(
              'Jumlah',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                // Tombol kurang
                IconButton(
                  onPressed: jumlah > 1 ? kurangiJumlah : null,
                  icon: const Icon(Icons.remove),
                ),

                Container(
                  width: 50,
                  alignment: Alignment.center,
                  child: Text(
                    '$jumlah',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Tombol tambah
                IconButton(
                  onPressed:
                      jumlah < product.stock ? tambahJumlah : null,
                  icon: const Icon(Icons.add),
                ),

                const SizedBox(width: 8),

                Text(
                  'dari ${product.stock} stok',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Tombol tambah ke keranjang
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: product.stock > 0
                    ? () {
                        Navigator.pop(context, jumlah);
                      }
                    : null,
                icon: const Icon(Icons.shopping_cart),
                label: Text(
                  'Tambah ke Keranjang ($jumlah)',
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
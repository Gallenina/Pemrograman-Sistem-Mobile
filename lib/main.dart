import 'package:flutter/material.dart';
import 'models/product.dart';
import 'widgets/product_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showProduct = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TokoKita'),
        ),
        body: Column(
          children: [
            if (showProduct)
              ProductCard(
                product: Product(
                  id: 1,
                  name: 'Laptop ASUS',
                  price: 7500000,
                  imageUrl: 'assets/laptop.jpg',
                  category: 'Elektronik',
                  stock: 10,
                  description: 'Laptop untuk kebutuhan kuliah',
                ),
              ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  showProduct = !showProduct;
                });
              },
              child: Text(
                showProduct
                    ? 'Sembunyikan Produk'
                    : 'Tampilkan Produk',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
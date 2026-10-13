
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product.dart';
import '../widgets/product_card.dart';
import '../controllers/cart_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        id: 1,
        name: 'Laptop ASUS',
        price: 7500000,
        imageUrl: 'assets/laptop.jpg',
        category: 'Elektronik',
        stock: 10,
        description: 'Laptop untuk kebutuhan kuliah',
      ),
      Product(
        id: 2,
        name: 'Mouse Logitech',
        price: 250000,
        imageUrl: 'assets/mouse.jpg',
        category: 'Aksesoris',
        stock: 15,
        description: 'Mouse wireless untuk laptop',
      ),
      Product(
        id: 3,
        name: 'Keyboard Mechanical',
        price: 650000,
        imageUrl: 'assets/keyboard.jpg',
        category: 'Aksesoris',
        stock: 8,
        description: 'Keyboard mechanical untuk mengetik',
      ),
      Product(
        id: 4,
        name: 'Headset Gaming',
        price: 450000,
        imageUrl: 'assets/headset.jpg',
        category: 'Gaming',
        stock: 12,
        description: 'Headset untuk bermain game',
      ),
      Product(
        id: 5,
        name: 'Monitor LG',
        price: 2200000,
        imageUrl: 'assets/monitor.jpg',
        category: 'Elektronik',
        stock: 6,
        description: 'Monitor untuk kebutuhan kerja dan belajar',
      ),
      Product(
        id: 6,
        name: 'Webcam Logitech',
        price: 550000,
        imageUrl: 'assets/webcam.jpg',
        category: 'Aksesoris',
        stock: 9,
        description: 'Webcam untuk meeting dan kuliah online',
      ),
      Product(
        id: 7,
        name: 'Flashdisk 64GB',
        price: 120000,
        imageUrl: 'assets/flashdisk.jpg',
        category: 'Penyimpanan',
        stock: 20,
        description: 'Flashdisk untuk menyimpan data',
      ),
      Product(
        id: 8,
        name: 'Harddisk External',
        price: 950000,
        imageUrl: 'assets/harddisk.jpg',
        category: 'Penyimpanan',
        stock: 7,
        description: 'Penyimpanan data eksternal',
      ),
      Product(
        id: 9,
        name: 'USB Hub',
        price: 150000,
        imageUrl: 'assets/usb_hub.jpg',
        category: 'Aksesoris',
        stock: 18,
        description: 'USB Hub untuk menambah port',
      ),
      Product(
        id: 10,
        name: 'Speaker Bluetooth',
        price: 350000,
        imageUrl: 'assets/speaker.jpg',
        category: 'Audio',
        stock: 11,
        description: 'Speaker Bluetooth portable',
      ),
      Product(
        id: 11,
        name: 'Powerbank 20000mAh',
        price: 300000,
        imageUrl: 'assets/powerbank.jpg',
        category: 'Aksesoris',
        stock: 14,
        description: 'Powerbank kapasitas besar',
      ),
      Product(
        id: 12,
        name: 'Kabel USB Type-C',
        price: 75000,
        imageUrl: 'assets/kabel.jpg',
        category: 'Aksesoris',
        stock: 25,
        description: 'Kabel USB Type-C berkualitas',
      ),
      Product(
        id: 13,
        name: 'Cooling Pad',
        price: 275000,
        imageUrl: 'assets/cooling_pad.jpg',
        category: 'Aksesoris',
        stock: 8,
        description: 'Pendingin tambahan untuk laptop',
      ),
      Product(
        id: 14,
        name: 'Gamepad Wireless',
        price: 400000,
        imageUrl: 'assets/gamepad.jpg',
        category: 'Gaming',
        stock: 10,
        description: 'Gamepad wireless untuk bermain game',
      ),
      Product(
        id: 15,
        name: 'Microphone USB',
        price: 600000,
        imageUrl: 'assets/microphone.jpg',
        category: 'Audio',
        stock: 5,
        description: 'Microphone USB untuk streaming',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('TokoKita'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TokoKita',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Belanja jadi lebih mudah',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                // Badge keranjang GetX
                Obx(
                  () => Stack(
                    clipBehavior: Clip.none,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          size: 30,
                        ),
                      ),
                      if (cartController.totalItem > 0)
                        Positioned(
                          right: 2,
                          top: 0,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            constraints: const BoxConstraints(
                              minWidth: 20,
                              minHeight: 20,
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '${cartController.totalItem}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Daftar produk
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: products[index],
                    onAddedToCart: (jumlah) {
                      cartController.addToCart(
                        products[index],
                        quantity: jumlah,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${products[index].name} sebanyak $jumlah berhasil ditambahkan!',
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
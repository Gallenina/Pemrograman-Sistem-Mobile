import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import 'checkout_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController =
        Get.find<CartController>();

    return Scaffold(
    appBar: AppBar(
      title: const Text('Keranjang Belanja'),
      actions: [
        Obx(() {
          if (cartController.items.isEmpty) {
            return const SizedBox.shrink();
          }

          return TextButton.icon(
            onPressed: () async {
              final konfirmasi = await Get.dialog<bool>(
                AlertDialog(
                  title: const Text('Kosongkan Keranjang?'),
                  content: const Text(
                    'Apakah kamu yakin ingin menghapus semua produk dari keranjang?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Get.back(result: false),
                      child: const Text('Batal'),
                    ),
                    TextButton(
                      onPressed: () => Get.back(result: true),
                      child: const Text(
                        'Ya, Kosongkan',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );

              if (konfirmasi == true) {
                cartController.clearCart();

                Get.snackbar(
                  'Keranjang',
                  'Semua produk berhasil dihapus.',
                  snackPosition: SnackPosition.BOTTOM,
                );
              }
            },
            icon: const Icon(
              Icons.delete_sweep_outlined,
              color: Colors.red,
            ),
            label: const Text(
              'Kosongkan',
              style: TextStyle(color: Colors.red),
            ),
          );
        }),
      ],
    ),
      body: Obx(() {
        if (cartController.items.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  size: 80,
                  color: Colors.grey,
                ),
                SizedBox(height: 16),
                Text(
                  'Keranjang masih kosong',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Text('Yuk, pilih produk favoritmu!'),
              ],
            ),
          );
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: cartController.items.length,
                itemBuilder: (context, index) {
                  final item = cartController.items[index];
                  final product = item.product;
                  final subtotal =
                      product.price * item.quantity;

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            child: Icon(Icons.shopping_bag),
                          ),
                          const SizedBox(width: 12),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Rp${product.price.toStringAsFixed(0)} / item',
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Subtotal: Rp${subtotal.toStringAsFixed(0)}',
                                  style: const TextStyle(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        cartController
                                            .decreaseQuantity(index);
                                      },
                                      icon: const Icon(
                                        Icons.remove_circle_outline,
                                      ),
                                      tooltip: 'Kurangi jumlah',
                                    ),

                                    Text(
                                      '${item.quantity}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    IconButton(
                                      onPressed: () {
                                        cartController
                                            .increaseQuantity(index);
                                      },
                                      icon: const Icon(
                                        Icons.add_circle_outline,
                                      ),
                                      tooltip: 'Tambah jumlah',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              cartController.removeFromCart(product);

                              Get.snackbar(
                                'Keranjang',
                                '${product.name} dihapus dari keranjang',
                                snackPosition:
                                    SnackPosition.BOTTOM,
                                duration:
                                    const Duration(seconds: 2),
                              );
                            },
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                            tooltip: 'Hapus produk',
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.2),
                    blurRadius: 8,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Total Belanja',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      'Rp${cartController.totalHarga.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      'Total ${cartController.totalItem} barang',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16),

                    ElevatedButton.icon(
                      onPressed: () {
                        if (cartController.items.isEmpty) {
                          Get.snackbar(
                            'Keranjang Kosong',
                            'Tambahkan produk sebelum checkout.',
                            snackPosition: SnackPosition.BOTTOM,
                          );
                          return;
                        }

                        Get.off(
                          () => const CheckoutPage(),
                        );
                      },
                      icon: const Icon(Icons.payment),
                      label: const Text('Checkout'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

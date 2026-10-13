import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController =
        Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Ringkasan Pesanan',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              Expanded(
                child: cartController.items.isEmpty
                    ? const Center(
                        child: Text('Tidak ada pesanan.'),
                      )
                    : ListView.builder(
                        itemCount: cartController.items.length,
                        itemBuilder: (context, index) {
                          final item =
                              cartController.items[index];
                          final subtotal =
                              item.product.price * item.quantity;

                          return Card(
                            child: ListTile(
                              title: Text(item.product.name),
                              subtitle: Text(
                                '${item.quantity} x Rp${item.product.price.toStringAsFixed(0)}',
                              ),
                              trailing: Text(
                                'Rp${subtotal.toStringAsFixed(0)}',
                              ),
                            ),
                          );
                        },
                      ),
              ),

              const Divider(),
              const SizedBox(height: 8),

              Text(
                'Total Barang: ${cartController.totalItem}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),

              Text(
                'Total Pembayaran: Rp${cartController.totalHarga.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 20),

              ElevatedButton.icon(
                onPressed: () {
                  Get.snackbar(
                    'Checkout',
                    'Ringkasan pesanan berhasil ditampilkan.',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('Konfirmasi Pesanan'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
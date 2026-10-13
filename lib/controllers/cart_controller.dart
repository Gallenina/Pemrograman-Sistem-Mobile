import 'package:get/get.dart';
import '../models/product.dart';

// Model untuk produk dan jumlahnya di keranjang
class CartItem {
  final Product product;
  final int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });
}

class CartController extends GetxController {

  // Mengosongkan seluruh keranjang
  void clearCart() {
    items.clear();
  }

  final RxList<CartItem> items = <CartItem>[].obs;

  // Menambahkan produk atau menambah jumlah produk yang sama
  void addToCart(Product product, {int quantity = 1}) {
    final index = items.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (index != -1) {
      final item = items[index];
      items[index] = CartItem(
        product: item.product,
        quantity: item.quantity + quantity,
      );
    } else {
      items.add(
        CartItem(
          product: product,
          quantity: quantity,
        ),
      );
    }
  }

  // Menambah jumlah produk
  void increaseQuantity(int index) {
    final item = items[index];

    items[index] = CartItem(
      product: item.product,
      quantity: item.quantity + 1,
    );
  }

  // Mengurangi jumlah produk
  void decreaseQuantity(int index) {
    final item = items[index];

    if (item.quantity > 1) {
      items[index] = CartItem(
        product: item.product,
        quantity: item.quantity - 1,
      );
    } else {
      items.removeAt(index);
    }
  }

  // Menghapus seluruh jumlah produk tersebut
  void removeFromCart(Product product) {
    items.removeWhere(
      (item) => item.product.id == product.id,
    );
  }

  // Menghitung total unit barang
  int get totalItem {
    return items.fold<int>(
      0,
      (total, item) => total + item.quantity,
    );
  }

  // Menghitung total harga berdasarkan jumlah produk
  double get totalHarga {
    return items.fold<double>(
      0.0,
      (total, item) =>
          total + (item.product.price * item.quantity),
    );
  }
}

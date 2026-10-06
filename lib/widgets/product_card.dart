import 'package:flutter/material.dart';
import '../models/product.dart';
import 'price_label.dart';
import 'stock_badge.dart';
import 'category_tag.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final Function(int) onAddedToCart;

  const ProductCard({
    super.key,
    required this.product,
    required this.onAddedToCart,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    print('ProductCard: initState()');
  }

  @override
  Widget build(BuildContext context) {
    print('ProductCard: build()');

        return Card(
      margin: const EdgeInsets.all(12),
      child: InkWell(
       onTap: () async {
        final result = await Navigator.pushNamed(
          context,
          '/detail',
          arguments: widget.product,
        );

        if (result != null && result is int) {
          widget.onAddedToCart(result);
        }
      },
        child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // BAGIAN KIRI: ICON + BADGE
            SizedBox(
              width: 130,
              height: 70,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Icon(
                    Icons.shopping_bag,
                    size: 60,
                  ),

                  // Badge Diskon
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Diskon',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // Badge Stok
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: StockBadge(
                        stock: widget.product.stock,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 16),

            // Expanded → menggunakan sisa ruang di sebelah kanan
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Flexible → aman karena berada di dalam Row
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          widget.product.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  CategoryTag(
                    category: widget.product.category,
                  ),

                  const SizedBox(height: 8),

                  PriceLabel(
                    price: widget.product.price,
                  ),

                  const SizedBox(height: 8),

                  StockBadge(
                    stock: widget.product.stock,
                  ),

                  const SizedBox(height: 10),

                  IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    icon: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }

  @override
  void dispose() {
    print('ProductCard: dispose()');
    super.dispose();
  }
}
import 'package:flutter/material.dart';
import '../models/product.dart';
import 'price_label.dart';
import 'stock_badge.dart';
import 'category_tag.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.shopping_bag,
              size: 60,
            ),

            const SizedBox(height: 10),

            Text(
              widget.product.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
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
    );
  }

  @override
  void dispose() {
    print('ProductCard: dispose()');
    super.dispose();
  }
}
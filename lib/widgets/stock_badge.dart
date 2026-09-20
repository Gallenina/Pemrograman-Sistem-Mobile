import 'package:flutter/material.dart';

class StockBadge extends StatelessWidget{
  final int stock;

  const StockBadge({
    super.key,
    required this.stock,
  });

  @override
  Widget build(BuildContext context){
    return Text(
      'Stok: $stock',
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }
}
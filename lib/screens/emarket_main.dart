import 'package:emarket/widgets/products_builder.dart';
import 'package:flutter/material.dart';

class EmarketMain extends StatelessWidget {
  const EmarketMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emarket'),
        backgroundColor: Colors.blue.shade400,
      ),
      body: const Center(child: ProductsBuilder()),
    );
  }
}

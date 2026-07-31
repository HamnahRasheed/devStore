import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dev_store/Model/store_model.dart';
import 'package:dev_store/Provider/cart_provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  final StoreModel product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      appBar: AppBar(
        backgroundColor: const Color(0xff121212),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Product Details', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 250,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: const Color(0xff1E1E1E), borderRadius: BorderRadius.circular(20)),
                child: Image.network(product.image ?? '', fit: BoxFit.contain),
              ),
            ),
            const SizedBox(height: 20),
            Text(product.title ?? '', style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${product.price?.toStringAsFixed(2)}', style: const TextStyle(color: Colors.green, fontSize: 24, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text('${product.rating?.rate} (${product.rating?.count})', style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Description', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(product.description ?? '', style: const TextStyle(color: Colors.grey, fontSize: 15, height: 1.4)),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                onPressed: () {
                  context.read<CartProvider>().addToCart(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Added to Cart!'), backgroundColor: Colors.green),
                  );
                },
                child: const Text('Add To Cart', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
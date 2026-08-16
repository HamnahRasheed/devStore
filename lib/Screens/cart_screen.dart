import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dev_store/Provider/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  void _showReceiptDialog(BuildContext context, CartProvider cart) {
    final now = DateTime.now();
    final formattedDate =
        "${now.day}/${now.month}/${now.year} ${now.hour}:${now.minute.toString().padLeft(2, '0')}";
    final itemsList = cart.items.values.toList();
    final total = cart.totalAmount;
    showDialog( context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog( backgroundColor: const Color(0xff1E1E1E),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Column(
            children: [ Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Dev', style: TextStyle(color: Colors.white,
                      fontSize: 24, fontWeight: FontWeight.bold)),
                  Text('Store', style: TextStyle(color: Colors.green,
                      fontSize: 24, fontWeight: FontWeight.bold)),
                ], ),
              const SizedBox(height: 5),
              const Text('Purchase Receipt', style: TextStyle(color: Colors.grey, fontSize: 14)),
              const Divider(color: Colors.grey),
            ], ),
          content: SizedBox( width: double.maxFinite,
            child: Column( mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Date: $formattedDate', style: const TextStyle(color: Colors.white70, fontSize: 13)),
                const SizedBox(height: 15),
                const Text('Items Purchased:', style: TextStyle(color: Colors.white, fontWeight:
                FontWeight.bold)),
                const SizedBox(height: 8),
                Flexible( child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: itemsList.length,
                    itemBuilder: (context, index) {
                      final item = itemsList[index];
                      final itemTotal = (item.product.price ?? 0.0) * item.quantity;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [ Expanded(
                              child: Text( '${item.quantity}x ${item.product.title}',
                                maxLines: 1,  overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.white70, fontSize: 14),
                              ), ),
                            Text('\$${itemTotal.toStringAsFixed(2)}', style: const TextStyle(color: Colors.green,
                                fontSize: 14)),
                          ], ),); },
                  ), ),
                const Divider(color: Colors.grey),
                Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ const Text('Total Paid:',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('\$${total.toStringAsFixed(2)}', style: const TextStyle(
                        color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold)),
                  ], ),
              ], ), ),
          actions: [ Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom( backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12), ),
                onPressed: () { cart.clearCart();
                  Navigator.pop(dialogContext); },
                child: const Text('Done', style: TextStyle(
                    color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ), ),
          ], ); }, ); }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      appBar: AppBar(
        title: const Text('My Cart', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xff121212),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: cart.items.isEmpty  ? const Center(
        child: Text( 'Your Cart is Empty',
          style: TextStyle(color: Colors.grey, fontSize: 18), ), )
          : Column( children: [
          Expanded( child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, i) {
                final cartItem = cart.items.values.toList()[i];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration( color: const Color(0xff1E1E1E),
                    borderRadius: BorderRadius.circular(15), ),
                  child: Row(
                    children: [ Image.network( cartItem.product.image ?? '',
                        height: 60,  width: 60,  fit: BoxFit.contain, ),
                      const SizedBox(width: 12),
                      Expanded( child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text( cartItem.product.title ?? '',
                              maxLines: 1,  overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text( '\$${cartItem.product.price?.toStringAsFixed(2)}',
                              style: const TextStyle(color: Colors.green), ),
                          ], ),),
                      Row( children: [
                          IconButton( icon: const Icon(Icons.remove, color: Colors.white),
                            onPressed: () {
                              cart.removeSingleItem(cartItem.product); }, ),
                          Text( '${cartItem.quantity}',
                            style: const TextStyle(color: Colors.white, fontSize: 16), ),
                          IconButton( icon: const Icon(Icons.add, color: Colors.white),
                            onPressed: () {
                              cart.addToCart(cartItem.product); }, ),
                        ], ), ], ),
                ); }, ), ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration( color: Color(0xff1E1E1E),
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)), ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Total:', style: TextStyle(color: Colors.grey, fontSize: 16)),
                    Text( '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle( color: Colors.green,
                        fontSize: 22, fontWeight: FontWeight.bold,
                      ), ), ], ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), ),
                  onPressed: () {
                    _showReceiptDialog(context, cart); },
                  child: const Text('Checkout', style: TextStyle(color: Colors.white, fontSize: 16)),
                ), ],
            ), ),
        ], ),
    ); }
}
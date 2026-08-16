import 'package:flutter/material.dart';
import 'package:dev_store/Model/store_model.dart';

class CartItem {
  final StoreModel product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartProvider with ChangeNotifier {
  final Map<int, CartItem> _items = {};

  Map<int, CartItem> get items => _items;

  int get itemCount {
    int total = 0;
    _items.forEach((key, cartItem) {
      total += cartItem.quantity;
    });
    return total;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += (cartItem.product.price ?? 0.0) * cartItem.quantity;
    });
    return total;
  }

  void addToCart(StoreModel product) {
    if (product.id == null) return;
    final int productId = product.id!.toInt();

    if (_items.containsKey(productId)) {
      _items.update(
        productId,
            (existingItem) => CartItem(
          product: existingItem.product,
          quantity: existingItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
            () => CartItem(product: product, quantity: 1),
      );
    }
    notifyListeners();
  }

  void removeSingleItem(StoreModel product) {
    if (product.id == null) return;
    final int productId = product.id!.toInt();

    if (!_items.containsKey(productId)) return;

    if (_items[productId]!.quantity > 1) {
      _items.update(
        productId,
            (existing) => CartItem(
          product: existing.product,
          quantity: existing.quantity - 1,
        ),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void removeItem(StoreModel product) {
    if (product.id == null) return;
    final int productId = product.id!.toInt();
    _items.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
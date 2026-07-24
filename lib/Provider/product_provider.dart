import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Model/store_model.dart';

class ProductProvider with ChangeNotifier {
  List<StoreModel> _productList = [];
  List<String> _categories = ['All'];
  String _selectedCategory = 'All';
  String _searchQuery = '';
  bool _isLoading = false;
  String _errorMessage = '';

  List<String> get categories => _categories;
  String get selectedCategory => _selectedCategory;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  List<StoreModel> get filteredProducts {
    return _productList.where((product) {
      final matchesCategory =
          _selectedCategory == 'All' ||
          (product.category != null &&
              product.category!.toLowerCase() ==
                  _selectedCategory.toLowerCase());

      final matchesSearch =
          _searchQuery.isEmpty ||
          (product.title != null &&
              product.title!.toLowerCase().contains(
                _searchQuery.toLowerCase(),
              ));

      return matchesCategory && matchesSearch;
    }).toList();
  }

  Future<void> fetchProducts() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products'),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        _productList = data.map((item) => StoreModel.fromJson(item)).toList();

        // Extract unique categories cleanly
        Set<String> uniqueCategories = {'All'};
        for (var product in _productList) {
          if (product.category != null && product.category!.isNotEmpty) {
            uniqueCategories.add(product.category!);
          }
        }
        _categories = uniqueCategories.toList();
      } else {
        _errorMessage = 'Failed to load products (${response.statusCode})';
      }
    } catch (e) {
      _errorMessage = 'An error occurred while fetching products.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }
}

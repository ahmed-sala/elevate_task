import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../data/model/ProductModel.dart';

class ProductRepository {
  final String baseUrl = 'https://fakestoreapi.com/products';

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data
          .map((productJson) => ProductModel.fromJson(productJson))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}

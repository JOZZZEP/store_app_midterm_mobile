import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/models/product.dart';
import 'package:store_app/models/storeProduct.dart';

class StoreProductAPI {
  static const String url = "https://fakestoreapi.com/products";

  static Future<StoreProduct> getProducts() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        return parseProducts(response.body);
      } else {
        return StoreProduct();
      }
    } catch (e) {
      return StoreProduct();
    }
  }

  static StoreProduct parseProducts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<Product> products =
        parsed.map<Product>((json) => Product.fromJson(json)).toList();
    StoreProduct storeProduct = StoreProduct();
    storeProduct.storeProduct = products;
    return storeProduct;
  }
}

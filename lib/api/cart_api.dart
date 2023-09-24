import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/models/index.dart';

class CartAPI {
  static const String url = "https://fakestoreapi.com/carts/user/1";

  static Future<Carts> getCarts() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        return parseCarts(response.body);
      } else {
        return Carts();
      }
    } catch (e) {
      return Carts();
    }
  }

  static Carts parseCarts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<Cart> cart = parsed.map<Cart>((json) => Cart.fromJson(json)).toList();
    Carts carts = Carts();
    carts.carts = cart;
    return carts;
  }
}

import 'dart:convert';
import 'package:automex_store/global_variables.dart';
import 'package:automex_store/models/product.dart';
import 'package:http/http.dart' as http;
class ProductController {

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse("$uri/api/popular-products"),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8"
          });
     

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        List<Product> products =
            data.map((product) => Product.fromJson(product)).toList();
        return products;
      } else {
        throw Exception("Failed to load products");
      }
    } catch (err) {
      throw Exception("Error loading products: $err");
    }
  }
}
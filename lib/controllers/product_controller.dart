import 'dart:convert';
import 'package:automex_store/global_variables.dart';
import 'package:automex_store/models/product.dart';
import 'package:http/http.dart' as http;

class ProductController {
  //define a function that return a future containing list of the product model objects
  Future<List<Product>> fetchProducts() async {
    // use a try block to handle any exception that might occur in the http response
    try {
      http.Response response = await http.get(
          Uri.parse("$uri/api/popular-products"),
          //set the http headers
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8"
          });

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        List<Product> products = data
            .map((product) => Product.fromMap(product as Map<String, dynamic>))
            .toList();

        return products;
      } else {
        throw Exception("Failed to load products");
      }
    } catch (err) {
      throw Exception("Error loading products: $err");
    }
  }

  Future<List<Product>> loadProductByCategory(String category) async {
    try {
      http.Response response = await http.get(
          Uri.parse('$uri/api/products-by-category/$category'),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8"
          });

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        List<Product> products = data
            .map((product) => Product.fromMap(product as Map<String, dynamic>))
            .toList();

        return products;
      } else {
        throw Exception("Failed to load products");
      }
    } catch (err) {
      throw Exception("Error loading products: $err");
    }
  }
}

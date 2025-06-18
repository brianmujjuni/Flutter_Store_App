import 'package:automex_store/models/product.dart';
import 'package:flutter/material.dart';

class PopularProduct extends StatefulWidget {
  const PopularProduct({super.key});

  @override
  State<PopularProduct> createState() => _PopularProductState();
}

class _PopularProductState extends State<PopularProduct> {
  //A future that will hold the list of popular products
  late Future<List<Product>> futurePopularProducts;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

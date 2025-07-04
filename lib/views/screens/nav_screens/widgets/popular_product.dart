import 'package:automex_store/controllers/product_controller.dart';
import 'package:automex_store/models/product.dart';
import 'package:automex_store/views/screens/nav_screens/widgets/product_item_widget.dart';
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
  void initState() {
    super.initState();
    futurePopularProducts = ProductController().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futurePopularProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No popular Products'),
            );
          } else {
            final products = snapshot.data;
            return SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products!.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductItemWidget(product: product,);
                },
              ),
            );
          }
        });
  }
}

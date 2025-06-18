import 'package:automex_store/models/product.dart';
import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  // const ProductItemWidget({super.key});
  final Product product;

  const ProductItemWidget({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 170,
            decoration: BoxDecoration(
              color: Color(0xffF2F2F2),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Stack(
              children: [
                Image.network(
                  product.images[0],
                  height: 170,
                  width: 170,
                  fit: BoxFit.cover,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

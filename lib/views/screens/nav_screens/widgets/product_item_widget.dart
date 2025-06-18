import 'package:automex_store/models/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                ),
                Positioned(
                  top: 15,
                  right: 10,
                  child: Image.asset(
                    'assets/icons/love.png',
                    width: 26,
                    height: 26,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/icons/cart.png',
                    height: 26,
                    width: 26,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            product.productName,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.roboto(
                fontSize: 13,
                color: Color(0xFF212121),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            product.category,
            style: GoogleFonts.quicksand(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Color(
                0xff868D94,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:automex_store/provider/cart_provider.dart';
import 'package:automex_store/views/screens/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartData = ref.watch(cartProvider);
    final _cartProvider = ref.read(cartProvider.notifier);
    return Scaffold(
      body: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 118,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/cartb.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 322,
                  top: 52,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/icons/not.png',
                        width: 25,
                        height: 25,
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 20,
                          height: 20,
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.yellow.shade800,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              cartData.length.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    left: 61,
                    top: 51,
                    child: Text(
                      'My Cart',
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
          ),
        ),
        body: cartData.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      'Your shopping cart is empty\n you can add product to your cart from the button below',
                      style:
                          GoogleFonts.roboto(fontSize: 15, letterSpacing: 1.7),
                    ),
                    TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return MainScreen();
                      }));
                    }, child: Text('Shop Now'))
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 49,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 49,
                              clipBehavior: Clip.hardEdge,
                              decoration:
                                  BoxDecoration(color: Color(0xFFD7DDFF)),
                            ),
                          ),
                          Positioned(
                            left: 44,
                            top: 19,
                            child: Container(
                              width: 10,
                              height: 10,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                          Positioned(
                            left: 69,
                            top: 14,
                            child: Text(
                              'You have ${cartData.length} items',
                              style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.7,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: cartData.length,
                        itemBuilder: (context, index) {
                          final cartItem = cartData.values.toList()[index];
                          return Card(
                            child: SizedBox(
                              height: 200,
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image.network(
                                      cartItem.image[0],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cartItem.productName,
                                        style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        cartItem.category,
                                        style: GoogleFonts.lato(
                                            color: Colors.grey, fontSize: 14),
                                      ),
                                      Text(
                                        "\$${cartItem.productPrice.toStringAsFixed(2)}",
                                        style: GoogleFonts.lato(
                                          color: Colors.pink,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 120,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF102DE1),
                                            ),
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    _cartProvider
                                                        .decrementCartItem(
                                                            cartItem.productId);
                                                  },
                                                  icon: Icon(
                                                    color: Colors.white,
                                                    CupertinoIcons.minus,
                                                  ),
                                                ),
                                                Text(
                                                  cartItem.quantity.toString(),
                                                  style: GoogleFonts.lato(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    _cartProvider
                                                        .incrementCartItem(
                                                            cartItem.productId);
                                                  },
                                                  icon: Icon(
                                                    color: Colors.white,
                                                    CupertinoIcons.plus,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          _cartProvider.removeCartItem(
                                              cartItem.productId);
                                        },
                                        icon: Icon(
                                          CupertinoIcons.delete,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        })
                  ],
                ),
              ),
      ),
    );
  }
}

import 'package:automex_store/models/category_model.dart';
import 'package:automex_store/views/screens/detail/screens/widgets/inner_category_content_widget.dart';
import 'package:automex_store/views/screens/nav_screens/account_screen.dart';
import 'package:automex_store/views/screens/nav_screens/cart_screen.dart';
import 'package:automex_store/views/screens/nav_screens/category_screen.dart';
import 'package:automex_store/views/screens/nav_screens/favorite_screen.dart';
import 'package:automex_store/views/screens/nav_screens/stores_screen.dart';
import 'package:flutter/material.dart';

class InnnerCategoryScreen extends StatefulWidget {
  final Category category;
  const InnnerCategoryScreen({super.key, required this.category});

  @override
  State<InnnerCategoryScreen> createState() => _InnnerCategoryScreenState();
}

class _InnnerCategoryScreenState extends State<InnnerCategoryScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      InnerCategoryContentWidget(category: widget.category),
      FavoriteScreen(),
      CategoryScreen(),
      StoresScreen(),
      CartScreen(),
      AccountScreen(),
    ];
    return Scaffold(
     
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          currentIndex: pageIndex,
          onTap: (value) {
            setState(() {
              pageIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icons/home.png",
                  width: 25,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icons/love.png",
                  width: 25,
                ),
                label: "Favourite"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.category,
                ),
                label: "Category"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icons/mart.png",
                  width: 25,
                ),
                label: "Stores"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icons/cart.png",
                  width: 25,
                ),
                label: "Cart"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icons/user.png",
                  width: 25,
                ),
                label: "Account")
          ]),
      body: pages[pageIndex],
    );
  }
}

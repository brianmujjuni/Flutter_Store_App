import 'package:automex_store/views/screens/detail/screens/widgets/inner_header_widget.dart';
import 'package:automex_store/views/screens/nav_screens/account_screen.dart';
import 'package:automex_store/views/screens/nav_screens/cart_screen.dart';
import 'package:automex_store/views/screens/nav_screens/category_screen.dart';
import 'package:automex_store/views/screens/nav_screens/favorite_screen.dart';
import 'package:automex_store/views/screens/nav_screens/home_screen.dart';
import 'package:automex_store/views/screens/nav_screens/stores_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    FavoriteScreen(),
    CategoryScreen(),
    StoresScreen(),
    CartScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(
      //     MediaQuery.of(context).size.height * 0.20,
      //   ),
      //   child: InnerHeaderWidget(),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        currentIndex: _pageIndex,
        onTap: (value) {
          setState(() {
            _pageIndex = value;
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
              label: "Favorite"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Categories"),
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
              label: "Account"),
        ],
      ),
      body: _pages[_pageIndex],
    );
  }
}

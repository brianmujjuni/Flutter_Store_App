import 'package:automex_store/views/screens/nav_screens/widgets/banner_widget.dart';
import 'package:automex_store/views/screens/nav_screens/widgets/category_item_widget.dart';
import 'package:automex_store/views/screens/nav_screens/widgets/header_widget.dart';
import 'package:automex_store/views/screens/nav_screens/widgets/popular_product.dart';
import 'package:automex_store/views/screens/nav_screens/widgets/reusable_text_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          HeaderWidget(),
          BannerWidget(),
          CategoryItemWidget(),
          ReusableTextWidget(title: 'Popular Products', subtitle: 'View all'),
         
          PopularProduct()
        ],
      ),
    ));
  }
}

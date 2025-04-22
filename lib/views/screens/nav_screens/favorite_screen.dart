import 'package:automex_store/views/screens/nav_screens/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          HeaderWidget(),
          Center(
            child: Text("Favorite Screen"),
          ),
        ],
      ),
    );
  }
}

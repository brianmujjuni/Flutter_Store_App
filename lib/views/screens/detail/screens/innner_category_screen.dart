import 'package:automex_store/models/category_model.dart';
import 'package:flutter/material.dart';

class InnnerCategoryScreen extends StatefulWidget {

 final Category category;
 const InnnerCategoryScreen({super.key,required this.category});


  @override
  State<InnnerCategoryScreen> createState() => _InnnerCategoryScreenState();
}

class _InnnerCategoryScreenState extends State<InnnerCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
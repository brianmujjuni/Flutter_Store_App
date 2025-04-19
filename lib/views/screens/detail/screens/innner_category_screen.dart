import 'package:automex_store/models/category_model.dart';
import 'package:automex_store/views/screens/detail/screens/widgets/inner_banner_widget.dart';
import 'package:automex_store/views/screens/detail/screens/widgets/inner_header_widget.dart';
import 'package:flutter/material.dart';

class InnnerCategoryScreen extends StatefulWidget {
  final Category category;
  const InnnerCategoryScreen({super.key, required this.category});

  @override
  State<InnnerCategoryScreen> createState() => _InnnerCategoryScreenState();
}

class _InnnerCategoryScreenState extends State<InnnerCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 20),
        child: InnerHeaderWidget(),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
           InnerBannerWidget(image: widget.category.banner)
          ]
          
        ),
      ),
    );
  }
}

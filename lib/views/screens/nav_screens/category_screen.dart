import 'package:automex_store/controllers/category_controller.dart';
import 'package:automex_store/models/category_model.dart';
import 'package:automex_store/views/screens/nav_screens/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<List<Category>> _categories;
  Category? _selectedCategory;
  @override
  void initState() {
    super.initState();
    _categories = CategoryController().fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 20),
        child: HeaderWidget(),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey.shade200,
              child: FutureBuilder(
                future: _categories,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error}"),
                    );
                  } else {
                    final categories = snapshot.data!;
                    return ListView.builder(
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final category = categories[index];
                          return ListTile(
                            // leading: Image.network(category.image,
                            //     width: 20, height: 20),
                            title: Text(
                              category.name,
                              style: GoogleFonts.quicksand(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: _selectedCategory == category?Colors.blue: Colors.black
                              ),
                            ),
                            onTap: () {
                              // Handle category tap
                              setState(() {
                                _selectedCategory = category;
                              });
                            },
                          );
                        });
                  }
                },
              ),
            ),
          ),
          //Right side display selected category details
          Expanded(flex: 5,child: _selectedCategory!=null?Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(_selectedCategory!.name),
              )
            ],
          ):Container(),)
        ],
      ),
    );
  }
}

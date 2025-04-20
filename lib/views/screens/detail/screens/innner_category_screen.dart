import 'package:automex_store/controllers/subcategory_controller.dart';
import 'package:automex_store/models/category_model.dart';
import 'package:automex_store/models/subcategory_model.dart';
import 'package:automex_store/views/screens/detail/screens/widgets/inner_banner_widget.dart';
import 'package:automex_store/views/screens/detail/screens/widgets/inner_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InnnerCategoryScreen extends StatefulWidget {
  final Category category;
  const InnnerCategoryScreen({super.key, required this.category});

  @override
  State<InnnerCategoryScreen> createState() => _InnnerCategoryScreenState();
}

class _InnnerCategoryScreenState extends State<InnnerCategoryScreen> {
  late Future<List<Subcategory>> _subCategories;
  final SubcategoryController _subcategoryController = SubcategoryController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _subCategories = _subcategoryController
        .getSubCategoriesByCategoryName(widget.category.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 20),
        child: InnerHeaderWidget(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InnerBannerWidget(image: widget.category.banner),
            Center(
              child: Text(
                "Shop By SubCategories",
                style: GoogleFonts.quicksand(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.7),
              ),
            ),
            FutureBuilder(
              future: _subCategories,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Error: ${snapshot.error}"),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text("No Categories Found"),
                  );
                } else {
                  final subcategories = snapshot.data!;
                  return GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: subcategories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8),
                    itemBuilder: (context, index) {
                      final subcategory = subcategories[index];
                      return InkWell(
                        onTap: () => {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.network(
                                subcategory.image,
                                height: 47,
                                width: 47,
                              ),
                              Text(
                                subcategory.subCategoryName,
                                style: GoogleFonts.quicksand(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

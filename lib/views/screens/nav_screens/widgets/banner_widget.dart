import 'package:automex_store/controllers/banner_controller.dart';
import 'package:automex_store/models/banner_model.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  late Future<List<BannerModel>> _banners;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _banners = BannerController().fetchBanners();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 170,
          decoration: BoxDecoration(
            color: Color(0xFFF7F7F7),
            borderRadius: BorderRadius.circular(4),
          ),
          child: FutureBuilder(
              future: _banners,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Error: ${snapshot.error}"),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text("No Banners Found"),
                  );
                } else {
                  final banners = snapshot.data!;
                  return PageView.builder(
                    itemCount: banners.length,
                    itemBuilder: (context, index) {
                      final banner = banners[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          banner.image,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: 170,
                        ),
                      );
                    },
                  );
                }
              })),
    );
  }
}

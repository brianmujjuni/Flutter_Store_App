import 'dart:convert';


import 'package:automex_store/global_variables.dart';
import 'package:automex_store/models/banner_model.dart';
import 'package:http/http.dart' as http;

class BannerController {

  //fetch banners from server
  Future<List<BannerModel>> fetchBanners() async {
    try {
      http.Response response = await http.get(Uri.parse("$uri/api/banner"),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8"
          });
      
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<BannerModel> banners =
            data.map((banner) => BannerModel.fromJson(banner)).toList();
        return banners;
      } else {
        throw Exception("Failed to load banners");
      }
    } catch (err) {
      throw Exception("Error: $err");
    }
  }
}

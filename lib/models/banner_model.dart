import 'dart:convert';

class BannerModel {
  final String id;
  final String image;

  BannerModel({required this.id, required this.image});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
    };
  }

  String toJson() => json.encode(toMap());
  
  factory BannerModel.fromJson(Map<String, dynamic> map) {
    return BannerModel(
      id: map['_id'],
      image: map['image'],
    );
  }
}

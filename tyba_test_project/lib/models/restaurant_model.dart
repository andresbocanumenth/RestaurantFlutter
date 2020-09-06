import 'package:flutter/cupertino.dart';

class RestaurantModel {
  String imageUrl;
  String name;
  String address;
  String phone;
  String priceRate;
  String description;
  String openNow;

  RestaurantModel(
      {this.imageUrl, this.name, this.address, this.phone, this.priceRate, this.description, this.openNow});

  factory RestaurantModel.fromMarshal(dynamic marshal) {
    if (marshal is Map) {
      String imageUrl = "https://redthread.uoregon.edu/files/original/affd16fd5264cab9197da4cd1a996f820e601ee4.png";
      if (marshal['photo'] != null) {
        imageUrl = marshal['photo']['images']['medium']['url'];
      }
      if (marshal['name'] == null) {
        return null;
      }
      return RestaurantModel(
          imageUrl: imageUrl,
          name: marshal['name'],
        address: marshal['address'],
        phone: marshal['phone'],
        priceRate: marshal['price'],
        description: marshal['description'],
        openNow: marshal['open_now_text']
      );
    } else {
      return null;
    }
  }
}

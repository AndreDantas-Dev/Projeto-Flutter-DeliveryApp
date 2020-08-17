import 'package:delivery_app/models/food_item.dart';

class Category {
  String imageURL;
  String title;
  List<FoodItem> items;

  Category.fromMap(Map<String, dynamic> json) {
    title = json["title"] ?? "";
    imageURL = json["imageURL"] ?? "";
    items = [];
    if (json["items"] != null)
      for (var item in json["items"] as List) {
        items.add(FoodItem.fromMap(item as Map<String, dynamic>));
      }
  }
}

class FoodItem {
  String title;
  double price;
  String imageURL;
  String unit;

  FoodItem.fromMap(Map<String, dynamic> json) {
    title = json["title"] ?? "";
    price = json["price"] as double ?? 0;
    imageURL = json["imageURL"] ?? "";
    unit = json["unit"] ?? "";
  }
}

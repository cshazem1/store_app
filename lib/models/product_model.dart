// ignore_for_file: prefer_typing_uninitialized_variables

class ProductModel {
  dynamic id;
  String title;
  var price;
  String description;
  String image;
  String category;
  Rating? rating;

  ProductModel({
    required this.rating,
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
  });
  factory ProductModel.fromJson(json) {
    return ProductModel(
        rating: json['rating'] == null ? null : Rating.fromJson(json["rating"]),
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        image: json["image"],
        category: json["category"]);
  }
}

class Rating {
  var rate;
  var count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(json) {
    return Rating(rate: json["rate"], count: json["count"]);
  }
}

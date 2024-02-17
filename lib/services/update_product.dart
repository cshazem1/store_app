import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';

class UpdateProduct {
  Future<ProductModel> addCategry({
    required String id,
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data =
        await Api().put(uri: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category
    });
    return ProductModel.fromJson(data);
  }
}

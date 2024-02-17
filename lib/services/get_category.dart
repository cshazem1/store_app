import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';

class GetCategry {
  List<ProductModel> productModel = [];
  Future<List<ProductModel>> getCategry({required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(uri: "https://fakestoreapi.com/products/category/$categoryName");
    for (int i = 0; i < data.length; i++) {
      productModel.add(ProductModel.fromJson(data[i]));
    }
    return productModel;
  }
}

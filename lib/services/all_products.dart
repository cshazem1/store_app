import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';

class AllProduct {
  List<ProductModel> productModel = [];
  Future<List<ProductModel>> getAllProduct() async {
    List<dynamic> data =
        await Api().get(uri: "https://fakestoreapi.com/products");
    for (int i = 0; i < data.length; i++) {
      productModel.add(ProductModel.fromJson(data[i]));
    }
    return productModel;
  }
}

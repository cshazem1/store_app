import 'package:store/helper/api.dart';

class AllCategories {
  Future<dynamic> getAllCategories() async {
    List<dynamic> data =
        await Api().get(uri: "https://fakestoreapi.com/products/categories");
    return data;
  }
}

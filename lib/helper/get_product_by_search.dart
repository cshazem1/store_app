import 'package:store/models/product_model.dart';

void getProductBySearch(
    {required List<ProductModel> list,
    required List<ProductModel> products,
    required String searchName}) {
  for (int i = 0; i < products.length; i++) {
    if (products[i].title.toLowerCase().contains(searchName.toLowerCase())) {
      list.add(products[i]);
    }
  }
}

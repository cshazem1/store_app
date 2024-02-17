import '../models/product_model.dart';
import '../services/update_product.dart';

Future<ProductModel> updateProduct(
    {required ProductModel productModel,
    String? tittle,
    String? price,
    String? desc,
    String? image}) async {
  ProductModel productModel1 = await UpdateProduct().addCategry(
      id: productModel.id.toString(),
      title: tittle ?? productModel.title,
      price: price ?? productModel.price.toString(),
      description: desc ?? productModel.description,
      image: image ?? productModel.image,
      category: productModel.category);
  return productModel1;
}

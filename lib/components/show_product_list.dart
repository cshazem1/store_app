import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../services/all_products.dart';
import '../services/get_category.dart';
import 'custom_card.dart';

// ignore: must_be_immutable
class ShowProductsList extends StatelessWidget {
  List<ProductModel>? list;
  String categryName;
  List<ProductModel>? products;
  String? searchName;
  Function(List<ProductModel>) productsList;
  ShowProductsList(
      {super.key,
      required this.productsList,
      required this.categryName,
      required this.products,
      required this.searchName,
      required this.list});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder<List<ProductModel>>(
        future:
            //name == null||name==""?
            categryName == "All"
                ? AllProduct().getAllProduct()
                : GetCategry().getCategry(categoryName: categryName),
        // : GetCategry().getCategry(categoryName: name!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            products = snapshot.data;
            list =
                searchName == "" || searchName == null ? snapshot.data! : list;
            products = snapshot.data!;
            productsList(products!);

            return SliverPadding(
              padding: const EdgeInsets.only(
                  top: 60.0, right: 15, left: 15, bottom: 10),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 110,
                ),
                delegate: SliverChildBuilderDelegate(childCount: list?.length,
                    (context, index) {
                  return CustomCard(productModel: list![index]);
                }),
              ),
            );
          } else {
            return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()));
          }
        });
  }
}

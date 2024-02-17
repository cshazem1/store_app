import 'package:flutter/material.dart';
import 'package:store/components/custom_text_field.dart';
import 'package:store/models/product_model.dart';
import '../components/drop_down_button.dart';
import '../components/show_product_list.dart';
import '../helper/get_product_by_search.dart';

class HomePage extends StatefulWidget {
  static String id = "HomePage";
  const HomePage({
    super.key,
  });
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductModel>? list;
  List<ProductModel>? products;

  bool isLoading = true;
  String? searchName;
  String categryName = "All";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text("New Trend"),
        ),
        body: CustomScrollView(
            clipBehavior: Clip.none, // Change clipping behavior here
            slivers: [
              const SliverToBoxAdapter(
                  child: SizedBox(
                height: 10,
              )),
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                sliver: SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 400,
                          child: CustomTextField(
                            icon: const Icon(Icons.search),
                            labelText: "Search",
                            hintText: "Search",
                            onChange: (data) {
                              list = [];
                              searchName = data;
                              if (products != null) {
                                setState(() {});
                                getProductBySearch(
                                    searchName: searchName!,
                                    list: list!,
                                    products: products!);
                              }
                            },
                            onSubmitted: (data) {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 140,
                            child: CustomDropDownButton((data) {
                              categryName = data;
                              setState(() {});
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ShowProductsList(
                productsList: (data) {
                  products = data;
                },
                categryName: categryName,
                list: list,
                products: products,
                searchName: searchName,
              )
            ]));
  }
}

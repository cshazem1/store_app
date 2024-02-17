import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/models/product_model.dart';
import '../components/custom_button.dart';
import '../components/custom_circle_image.dart';
import '../components/custom_text_field.dart';
import '../helper/updateProduct.dart';

class UpdatePage extends StatefulWidget {
  static String id = "UpdatePage";

  const UpdatePage({super.key});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String? tittle;
  String? desc;
  String? price;
  String? image;

  bool isLoading = false;
  bool enable = false;
  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
          "${productModel.title.substring(0, 7)}...",
          style: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              CustomCircleImage(
                  diameter: 200,
                  urlImage: image == null ? productModel.image : image!),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    enable = !enable;
                    setState(() {});
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          !enable ? Colors.blue : Colors.black)),
                  child: const Text("Update",
                      style: TextStyle(color: Colors.white))),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                enable: enable,
                initialText: productModel.title,
                onSubmitted: (p0) {},
                onChange: (data) {
                  tittle = data;
                },
                hintText: "enter  new tittle",
                labelText: "Tittle",
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                enable: enable,
                initialText: productModel.description,
                onSubmitted: (p0) {},
                onChange: (data) {
                  desc = data;
                },
                hintText: "enter new description",
                labelText: "description",
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                enable: enable,
                initialText: productModel.price.toString(),
                onSubmitted: (p0) {},
                onChange: (data) {
                  price = data;
                },
                hintText: "enter new price",
                labelText: "price",
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                enable: enable,
                initialText: productModel.image,
                onSubmitted: (data) {
                  image = data;
                  setState(() {});
                },
                onChange: (data) {},
                hintText: "enter new image",
                labelText: "image",
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                text: "Sure",
                onClick: () async {
                  await updateProduct(
                    productModel: productModel,
                    image: image,
                    desc: desc,
                    price: price,
                    tittle: tittle,
                  );
                  setState(() {
                    isLoading = true;
                  });

                  try {
                    // ignore: use_build_context_synchronously
                    AnimatedSnackBar.rectangle(
                      'Success',
                      'The modification has been made',
                      type: AnimatedSnackBarType.success,
                      brightness: Brightness.light,
                    ).show(
                      context,
                    );
                  } on Exception {
                    // TODO
                  }
                  setState(() {
                    isLoading = false;
                  });
                },
              )
            ],
          ),
        )),
      ),
    );
  }
}

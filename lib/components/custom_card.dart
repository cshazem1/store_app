import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:store/pages/update_page.dart';

import '../models/product_model.dart';
import 'custom_icon.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  ProductModel productModel;
  CustomCard({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdatePage.id, arguments: productModel);
      },
      onLongPress: () {
        AnimatedSnackBar.material(
          animationDuration: const Duration(milliseconds: 900),
          duration: const Duration(milliseconds: 1600),
          mobilePositionSettings:
              const MobilePositionSettings(topOnDissapear: 10),
          borderRadius: BorderRadius.circular(40),
          productModel.title,
          type: AnimatedSnackBarType.info,
          mobileSnackBarPosition: MobileSnackBarPosition
              .top, // Position of snack_bar on mobile devices
          desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
          // Position of snack_bar on desktop devices
        ).show(context);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.3),
                  blurRadius: 40,
                  spreadRadius: 10,
                  offset: const Offset(10, 10))
            ]),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${productModel.title.substring(0, 6)}....",
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r"$" "${productModel.price.toString()}",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                          const CustomIcon()
                        ],
                      )
                    ]),
              ),
            ),
          ),
          Positioned(
            top: -65,
            right: 30,
            child: SizedBox(
                height: 100,
                width: 100,
                child: Image.network(productModel.image)),
          )
        ],
      ),
    );
  }
}

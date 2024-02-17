import 'package:flutter/material.dart';
import 'package:store/helper/load_image.dart';

// ignore: must_be_immutable
class CustomCircleImage extends StatelessWidget {
  String urlImage;
  double diameter;
  CustomCircleImage(
      {super.key, required this.urlImage, required this.diameter});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: diameter + 15,
      width: diameter + 15,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(200)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Colors.white,
      ),
      child: Center(
        child: Container(
          height: diameter,
          width: diameter,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            color: Colors.blue,
          ),
          child: FutureBuilder(
            future: loadImage(urlImage),
            builder: (context, AsyncSnapshot<ImageProvider> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  // If there's an error loading the image, show a placeholder or an error message
                  return const SizedBox(
                      height: 110,
                      width: 110,
                      child: Icon(Icons.error)); // Placeholder error icon
                } else {
                  // If image is successfully loaded, display it
                  return Center(
                      child: Container(
                          height: diameter - 15,
                          width: diameter - 15,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 10,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                  image: snapshot.data!, fit: BoxFit.fill))));
                }
              } else {
                // While the image is loading, show a placeholder (you can use a loading spinner or a placeholder image)
                return const CircularProgressIndicator(); // Loading spinner
              }
            },
          ),
        ),
      ),
    );
  }
}

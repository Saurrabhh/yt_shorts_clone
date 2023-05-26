import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class SquareAvatar extends StatelessWidget {
  const SquareAvatar({Key? key, required this.imgUrl}) : super(key: key);
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      margin: const EdgeInsets.only(top: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: FancyShimmerImage(
          height: 45,
          width: 45,
          imageUrl: imgUrl,
          boxFit: BoxFit.cover,
        ),
      ),
    );
  }
}

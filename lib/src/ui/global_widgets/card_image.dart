import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double heigth;
  final VoidCallback? onPress;

  const CardImage(
      {Key? key,
      required this.imageUrl,
      required this.width,
      required this.heigth,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        width: width,
        height: heigth,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

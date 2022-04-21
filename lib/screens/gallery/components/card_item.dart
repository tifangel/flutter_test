import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
            child: Image.network(
          image,
          // height: 400,
          fit: BoxFit.cover,
          width: double.infinity,
        )),
      ],
    );
  }
}

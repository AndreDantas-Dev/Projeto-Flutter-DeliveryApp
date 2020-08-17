import 'package:flutter/material.dart';

class DefaultBackground extends StatelessWidget {
  final String imageName;
  final Color color;
  const DefaultBackground({this.imageName, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          color: color,
          image: imageName != null
              ? DecorationImage(fit: BoxFit.fill, image: AssetImage(imageName))
              : null),
    );
  }
}

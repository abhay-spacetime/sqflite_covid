import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.color = Colors.black,
    this.alignment = Alignment.topLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: alignment,
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontFamily: DefaultTextStyle.of(context).style.fontFamily,
          ),
        ));
  }
}

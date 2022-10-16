import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:sqlicrud_demo/screens/widgets/custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hint;
  final TextEditingController controller;
  final bool flag;

  const CustomTextFormField(
      {super.key,
      required this.text,
      required this.hint,
      this.flag = false,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        CustomText(
          text: text,
          color: Colors.grey.shade900,
          fontSize: 14,
        ),
        TextFormField(
          controller: controller,
          obscureText: flag,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            fillColor: Colors.white,
          ),
        )
      ]),
    );
  }
}

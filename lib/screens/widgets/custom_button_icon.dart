import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sqlicrud_demo/screens/widgets/custom_text.dart';

class CustomButtomIcon extends StatelessWidget {
  const CustomButtomIcon(
      {super.key,
      required this.text,
      required this.onPress,
      required this.icon});
  final String text;
  final Function onPress;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          onPress();
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              SizedBox(width: 20),
              CustomText(
                color: Colors.black,
                text: text,
                alignment: Alignment.topCenter,
              ),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:insta_clone/utils/colors.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.child, required this.ontap});
  final ontap;
  final String child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: const ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          color: blueColor,
        ),
        child: Text(child),
      ),
    );
  }
}

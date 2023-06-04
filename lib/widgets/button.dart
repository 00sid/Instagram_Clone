import 'package:flutter/material.dart';
import 'package:insta_clone/utils/colors.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  Button(
      {super.key,
      required this.child,
      required this.ontap,
      this.loading = false});
  // ignore: prefer_typing_uninitialized_variables
  final ontap;
  final String child;
  bool loading = false;

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
        child: loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Text(child),
      ),
    );
  }
}

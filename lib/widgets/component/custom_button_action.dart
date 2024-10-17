import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButtonAction extends StatefulWidget {
  final IconData icon;
  final bool isLeftRadius;
  final bool isDisable;
  VoidCallback onTap;
  CustomButtonAction(
      {super.key,
      required this.icon,
      required this.onTap,
      this.isDisable = false,
      this.isLeftRadius = false});

  @override
  State<CustomButtonAction> createState() => _CustomButtonActionState();
}

class _CustomButtonActionState extends State<CustomButtonAction> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isDisable ? null : widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          // color: Colors.blue,
          border:
              Border.all(color: widget.isDisable ? Colors.grey : Colors.black),
          borderRadius: widget.isLeftRadius
              ? const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                )
              : const BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
        ),
        child: Center(
          child: Icon(
            widget.icon,
            color: widget.isDisable ? Colors.grey : Colors.black,
            size: 20,
          ),
        ),
      ),
    );
  }
}

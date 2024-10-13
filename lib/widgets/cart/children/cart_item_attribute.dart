import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartItemAttribute extends StatefulWidget {
  const CartItemAttribute({super.key});

  @override
  State<CartItemAttribute> createState() => _CartItemAttributeState();
}

class _CartItemAttributeState extends State<CartItemAttribute> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Màu sắc"),
        Wrap(
          children: List.generate(10, (index) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(right: 10),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            );
          }),
        ),
        Divider(),
      ],
    );
  }
}

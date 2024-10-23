import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomerLoading extends StatefulWidget {
  final Widget templateItem;
  const CustomerLoading({super.key, required this.templateItem});

  @override
  State<CustomerLoading> createState() => _CustomerLoadingState();
}

class _CustomerLoadingState extends State<CustomerLoading> {
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        enableSwitchAnimation: true, child: widget.templateItem);
  }
}

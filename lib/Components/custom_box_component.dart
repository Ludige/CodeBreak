// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComponentCustomBox extends StatefulWidget {
  EdgeInsets? margin;
  double height;
  double width;
  Color backgroundColor;
  double borderRadius;
  Widget? child;

  ComponentCustomBox({
    super.key,
    this.margin,
    this.height = 50,
    this.width = 45,
    this.backgroundColor = Colors.black38,
    this.borderRadius = 8,
    this.child,
  });

  @override
  State<ComponentCustomBox> createState() => _ComponentCustomBoxState();
}

class _ComponentCustomBoxState extends State<ComponentCustomBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      height: widget.height,
      width: Get.width * (widget.width / 100),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: widget.child ?? null,
    );
  }
}

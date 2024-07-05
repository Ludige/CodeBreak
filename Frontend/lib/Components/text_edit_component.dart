
import 'package:duocode/Components/input_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ComponentEditText extends StatefulWidget {
  double textFontSize;
  TextOverflow overflow;
  String? text;
  Color? textColor;
  bool boldFont;

  ComponentEditText({
    super.key,
    required this.text,
    this.textFontSize = 20,
    this.overflow = TextOverflow.ellipsis,
    this.textColor,
    this.boldFont = false,
  });

  @override
  State<ComponentEditText> createState() => _ComponentTextState();
}

class _ComponentTextState extends State<ComponentEditText> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controllerName = TextEditingController();
    return SizedBox(
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: Get.width * (7.5 / 10),
                margin: const EdgeInsets.only(left: 16),
                child: Text(
                  widget.text.toString(),
                  style: TextStyle(
                    fontSize: widget.textFontSize,
                    fontFamily: 'Imprima-Regular',
                    overflow: widget.overflow,
                    color: widget.textColor,
                    fontWeight:
                        widget.boldFont ? FontWeight.bold : FontWeight.normal,
                  ),
                  maxLines: 1,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 16, right: 10),
                child: ComponentInput(controller: controllerName),
              ),
            ],
          )
          // Column(

          // )
        ],
      ),
    );
  }
}

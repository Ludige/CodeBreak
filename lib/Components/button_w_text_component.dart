import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComponentTextButton extends StatefulWidget {
  String? text;
  IconData? icon;
  Color? textColor;
  Color? iconColor;
  double? fontSize;
  double? iconSize;
  Function onPressed;
  MainAxisAlignment mainAxisAlignment;
  double height;
  double? width;
  double rightPadding;
  double leftPadding;
  double spaceBetweenIconAndText;
  bool hoverAnimation;

  ComponentTextButton({
    super.key,
    this.text,
    this.icon,
    this.textColor,
    this.iconColor,
    this.fontSize = 14,
    this.iconSize = 20,
    required this.onPressed,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.height = 6,
    this.width,
    this.leftPadding = 0,
    this.rightPadding = 0,
    this.spaceBetweenIconAndText = 0,
    this.hoverAnimation = true,
  });
  @override
  State<ComponentTextButton> createState() => _ComponentTextButtonState();
}

class _ComponentTextButtonState extends State<ComponentTextButton> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = Get.height;
    return SizedBox(
      width: widget.width,
      height: screenHeight * (widget.height / 100),
      child: TextButton(
        style: widget.hoverAnimation
            ? null
            : TextButton.styleFrom(
                foregroundColor: Colors.black, //TODO
              ),
        child: Row(
          mainAxisAlignment: widget.mainAxisAlignment,
          children: [
            Container(
              padding: EdgeInsets.only(left: widget.leftPadding),
              child: widget.icon != null
                  ? Icon(
                      widget.icon,
                      color: widget.iconColor,
                      size: widget.iconSize,
                    )
                  : null,
            ),
            Container(
              padding: EdgeInsets.only(
                right: widget.rightPadding,
                left: widget.spaceBetweenIconAndText,
              ),
              child: widget.text != null
                  ? Text(
                      widget.text.toString(),
                      style: TextStyle(
                        color: widget.textColor,
                        fontSize: widget.fontSize,
                      ),
                    )
                  : null,
            ),
          ],
        ),
        onPressed: () {
          widget.onPressed();
        },
      ),
    );
  }
}

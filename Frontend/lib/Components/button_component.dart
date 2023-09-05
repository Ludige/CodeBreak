import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComponentButton extends StatefulWidget {
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

  ComponentButton({
    super.key,
    this.text,
    this.icon,
    this.textColor = Colors.white,
    this.iconColor = Colors.white,
    this.fontSize = 18,
    this.iconSize = 26,
    required this.onPressed,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.height = 6,
    this.width,
    this.leftPadding = 0,
    this.rightPadding = 0,
    this.spaceBetweenIconAndText = 5,
    this.hoverAnimation = true,
  });
  @override
  State<ComponentButton> createState() => _ComponentButtonState();
}

class _ComponentButtonState extends State<ComponentButton> {
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

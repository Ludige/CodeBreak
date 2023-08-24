import 'package:flutter/material.dart';

class ComponentText extends StatefulWidget {
  double fontSize;
  TextOverflow overflow;
  int maxLines;
  String? text;
  Color? color;
  bool boldFont;

  ComponentText({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines = 1,
    this.color,
    this.boldFont = false,
  });

  @override
  State<ComponentText> createState() => _ComponentTextState();
}

class _ComponentTextState extends State<ComponentText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text.toString(),
      style: TextStyle(
        fontSize: widget.fontSize,
        fontFamily: 'Imprima-Regular',
        overflow: widget.overflow,
        color: widget.color,
        fontWeight: widget.boldFont ? FontWeight.bold : FontWeight.normal,
      ),
      maxLines: 1,
    );
  }
}

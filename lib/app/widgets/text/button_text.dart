import 'package:flutter/material.dart';
import 'package:mapstudio/common/utils/text_scale_util.dart';

class DefaultText extends StatefulWidget {
  final String text;
  final double buttonSize;
  final Color color;
  const DefaultText(
      {super.key,
      required this.text,
      required this.buttonSize,
      required this.color});

  @override
  State<DefaultText> createState() => _DefaultTextState();
}

class _DefaultTextState extends State<DefaultText> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.text,
          style: TextStyle(
              letterSpacing: 2,
              fontSize: widget.buttonSize,
              fontWeight: FontWeight.bold,
              color: widget.color),
          textAlign: TextAlign.center,
          textScaler:
              TextScaler.linear(TextScaleUtil.textScaleFactor(context))),
    );
  }
}

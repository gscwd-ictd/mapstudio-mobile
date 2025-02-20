import 'package:flutter/material.dart';
import 'package:mapstudio/common/utils/text_scale_util.dart';

// ignore: must_be_immutable
class DefaultText extends StatefulWidget {
  final String text;
  final double txtSize;
  final Color color;
  FontWeight? fontWeight;
  DefaultText(
      {super.key,
      required this.text,
      required this.txtSize,
      required this.color,
      this.fontWeight});

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
              fontSize: widget.txtSize,
              fontWeight: widget.fontWeight ?? FontWeight.bold,
              color: widget.color),
          textAlign: TextAlign.center,
          textScaler:
              TextScaler.linear(TextScaleUtil.textScaleFactor(context))),
    );
  }
}

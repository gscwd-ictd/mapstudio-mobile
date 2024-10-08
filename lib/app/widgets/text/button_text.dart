import 'package:flutter/material.dart';
import 'package:mapstudio/common/utils/text_scale_util.dart';

class ButtonText extends StatefulWidget {
  final String buttonText;
  final double buttonSize;
  final Color color;
  const ButtonText(
      {super.key,
      required this.buttonText,
      required this.buttonSize,
      required this.color});

  @override
  State<ButtonText> createState() => _ButtonTextState();
}

class _ButtonTextState extends State<ButtonText> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.buttonText,
          style: TextStyle(
              letterSpacing: 2,
              fontSize: widget.buttonSize,
              fontWeight: FontWeight.w500,
              color: widget.color),
          textAlign: TextAlign.center,
          textScaler:
              TextScaler.linear(TextScaleUtil.textScaleFactor(context))),
    );
  }
}

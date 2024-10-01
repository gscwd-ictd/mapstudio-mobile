import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mapstudio/app/widgets/text/button_text.dart';

// ignore: must_be_immutable
class DefaultButton extends StatefulWidget {
  final Function onPressed;
  final String buttonText;
  final double buttonWidth;
  Color? color;
  Color? txtColor;
  DefaultButton(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      required this.buttonWidth,
      this.color,
      this.txtColor});

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: widget.color == null
              ? const Color.fromARGB(255, 37, 99, 235)
              : widget.color!,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.buttonWidth),
        child: ButtonText(
          color: widget.txtColor == null ? Colors.white : widget.txtColor!,
          buttonText: widget.buttonText,
          buttonSize: 18,
        ),
      ),
      onPressed: () {
        widget.onPressed();
      },
    );
  }
}

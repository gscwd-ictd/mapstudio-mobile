import 'package:flutter/material.dart';
import 'package:mapstudio/app/widgets/text/button_text.dart';

// ignore: must_be_immutable
class RoundedButton extends StatefulWidget {
  final Function onPressed;
  final String buttonText;
  final double buttonWidth;
  Color? color;
  Color? txtColor;
  double? txtSize;

  RoundedButton(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      required this.buttonWidth,
      this.color,
      this.txtColor,
      this.txtSize});

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          backgroundColor: widget.color == null
              ? const Color.fromARGB(255, 37, 99, 235)
              : widget.color!,
          padding: const EdgeInsets.symmetric(horizontal: 10)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.buttonWidth),
        child: DefaultText(
          color: widget.txtColor == null ? Colors.white : widget.txtColor!,
          text: widget.buttonText,
          txtSize: widget.txtSize == null ? 18 : widget.txtSize!,
        ),
      ),
      onPressed: () {
        widget.onPressed();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mapstudio/app/widgets/text/button_text.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class DefaultButton extends StatefulWidget {
  final Function onPressed;
  final String buttonText;
  final double buttonWidth;
  Color? btnColor;
  Color? txtColor;
  BorderSide? borderSide;
  BorderRadiusGeometry? radius;
  double? txtSize;
  DefaultButton(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      required this.buttonWidth,
      this.btnColor,
      this.txtColor,
      this.borderSide,
      this.radius,
      this.txtSize});

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: widget.radius ?? BorderRadius.circular(80),
              side: widget.borderSide ?? BorderSide.none),
          backgroundColor: widget.btnColor == null
              ? const Color.fromARGB(255, 37, 99, 235)
              : widget.btnColor!,
          padding: const EdgeInsets.symmetric(horizontal: 10)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.buttonWidth),
        child: DefaultText(
          fontWeight: FontWeight.normal,
          color: widget.txtColor == null ? Colors.white : widget.txtColor!,
          text: widget.buttonText,
          txtSize: widget.txtSize ?? 14.sp,
        ),
      ),
      onPressed: () {
        widget.onPressed();
      },
    );
  }
}

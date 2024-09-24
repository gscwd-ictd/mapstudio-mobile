import 'package:flutter/material.dart';

class ToolTipButton extends StatefulWidget {
  final IconData iconData;
  final Function onPressed;
  final int currentLayer;
  final int index;
  const ToolTipButton(
      {super.key,
      required this.iconData,
      required this.onPressed,
      required this.currentLayer,
      required this.index});

  @override
  State<ToolTipButton> createState() => _ToolTipButtonState();
}

class _ToolTipButtonState extends State<ToolTipButton> {
  @override
  Widget build(BuildContext context) {
    int currentLayer = widget.currentLayer;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            textStyle:
                const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        child: Icon(
          widget.iconData,
          size: 30,
          color:
              currentLayer == widget.index ? Colors.blueAccent : Colors.black,
        ),
        onPressed: () {
          widget.onPressed();
        },
      ),
    );
  }
}

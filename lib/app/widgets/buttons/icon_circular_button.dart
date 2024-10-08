import 'package:flutter/material.dart';

class IconCircularButton extends StatefulWidget {
  const IconCircularButton({super.key});

  @override
  State<IconCircularButton> createState() => _IconCircularButtonState();
}

class _IconCircularButtonState extends State<IconCircularButton> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.7,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: const CircleBorder(
                  side: BorderSide(color: Colors.blue, width: 3)),
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.blue,
            size: 25,
            weight: 10,
          )),
    );
  }
}

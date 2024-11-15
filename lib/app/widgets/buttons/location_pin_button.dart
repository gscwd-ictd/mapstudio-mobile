import 'package:flutter/material.dart';
import 'package:mapstudio/app/widgets/text/button_text.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class LocationPinButton extends StatefulWidget {
  final Function onPressed;
  const LocationPinButton({
    super.key,
    required this.onPressed,
  });

  @override
  State<LocationPinButton> createState() => _LocationPinButtonState();
}

class _LocationPinButtonState extends State<LocationPinButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.onPressed();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 0)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Image.asset('assets/images/pin_surveyor.png'),
      ),
    );
  }
}

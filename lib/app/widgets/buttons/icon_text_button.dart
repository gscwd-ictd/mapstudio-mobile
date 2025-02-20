// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class IconTextButton extends StatefulWidget {
  final Function onPressed;
  final String buttonText;
  final FaIcon icon;
  Color? color;
  Color? txtColor;
  double? txtSize;
  double? iconSize;

  IconTextButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.icon,
    this.color,
    this.txtColor,
    this.txtSize,
    this.iconSize,
  });

  @override
  State<IconTextButton> createState() => _IconTextButtonState();
}

class _IconTextButtonState extends State<IconTextButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FaIcon(
          FontAwesomeIcons.penToSquare,
          color: Colors.grey[500],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 3, 0, 0),
          child: Text(
            'Edit',
            style: TextStyle(
                color: Colors.grey[500],
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

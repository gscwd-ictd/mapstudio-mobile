import 'package:flutter/material.dart';
import 'package:mapstudio/common/utils/sizer_util.dart';

class TextRadioButton extends StatefulWidget {
  final int value;
  final int groupValue;
  final String name;
  const TextRadioButton(
      {super.key,
      required this.value,
      required this.groupValue,
      required this.name});

  @override
  State<TextRadioButton> createState() => _TextRadioButtonState();
}

class _TextRadioButtonState extends State<TextRadioButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizerUtil.width(context) / 6,
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 10),
        minTileHeight: 5,
        horizontalTitleGap: 0.1,
        minLeadingWidth: 20,
        minVerticalPadding: 1,
        title: Text(
          widget.name,
          style: const TextStyle(fontSize: 13),
        ),
        leading: SizedBox(
          width: 20,
          child: Transform.scale(
            scale: 0.8,
            child: Radio<int>(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: widget.value,
              groupValue: widget.groupValue,
              activeColor: Colors.black, // Change the fill color when selected
              splashRadius: 1, // Change the splash radius when clicked
              onChanged: (int? value) {},
            ),
          ),
        ),
      ),
    );
  }
}

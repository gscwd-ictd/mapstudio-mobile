import 'package:flutter/material.dart';
import 'package:mapstudio/common/enums/radio_button_enum.dart';
import 'package:mapstudio/common/utils/radio_button_util.dart';
import 'package:mapstudio/common/utils/sizer_util.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class TextRadioButton extends StatefulWidget {
  final int value;
  final String name;
  final Function onPressed;
  final RadioButtonEnum rbMode;
  double width = 0;
  TextRadioButton(
      {super.key,
      required this.value,
      required this.name,
      required this.onPressed,
      required this.rbMode,
      this.width = 0});

  @override
  State<TextRadioButton> createState() => _TextRadioButtonState();
}

class _TextRadioButtonState extends State<TextRadioButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20.w,
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 10),
        minTileHeight: 5,
        horizontalTitleGap: 0.1,
        minLeadingWidth: 18,
        minVerticalPadding: 1,
        title: Text(
          widget.name,
          style: TextStyle(fontSize: 15.sp),
        ),
        leading: SizedBox(
          width: 2.w,
          child: Transform.scale(
            scale: 0.8,
            child: Radio<int>(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: widget.value,
              groupValue: RadioButtonUtil.getRbSelection(widget.rbMode),
              activeColor: Colors.black, // Change the fill color when selected
              splashRadius: 1, // Change the splash radius when clicked
              onChanged: (int? value) {
                RadioButtonUtil.setRbSelection(widget.rbMode, value!);
                widget.onPressed();
              },
            ),
          ),
        ),
      ),
    );
  }
}

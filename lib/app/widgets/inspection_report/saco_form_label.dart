import 'package:flutter/material.dart';
import 'package:mapstudio/app/widgets/buttons/text_radio_button.dart';
import 'package:mapstudio/common/constants/labels.dart';
import 'package:mapstudio/common/enums/radio_button_enum.dart';
import 'package:sizer/sizer.dart';

class SacoFormLabelAndEntry extends StatefulWidget {
  final String label;
  final String entry;

  const SacoFormLabelAndEntry(
      {super.key, required this.label, required this.entry});

  @override
  State<SacoFormLabelAndEntry> createState() => _SacoFormLabelAndEntryState();
}

class _SacoFormLabelAndEntryState extends State<SacoFormLabelAndEntry> {
  int sysAvail = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Text(
              widget.label,
              style: AppLabels.frmLblTxtStyle,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 13.w),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.entry,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    )
                  ])),
        ],
      ),
    );
  }
}

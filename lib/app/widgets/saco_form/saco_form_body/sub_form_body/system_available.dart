import 'package:flutter/material.dart';
import 'package:mapstudio/app/widgets/buttons/text_radio_button.dart';
import 'package:mapstudio/common/constants/labels.dart';
import 'package:mapstudio/common/enums/radio_button_enum.dart';
import 'package:sizer/sizer.dart';

class SystemAvailable extends StatefulWidget {
  const SystemAvailable({super.key});

  @override
  State<SystemAvailable> createState() => _SystemAvailableState();
}

class _SystemAvailableState extends State<SystemAvailable> {
  int sysAvail = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 0.5.h),
            child: Text(
              'System is Available',
              style: AppLabels.frmLblTxtStyle,
            ),
          ),
          TextRadioButton(
            rbMode: RadioButtonEnum.sysAvail,
            onPressed: () {
              setState(() {});
            },
            value: 1,
            name: 'Yes',
          ),
          TextRadioButton(
            rbMode: RadioButtonEnum.sysAvail,
            onPressed: () {
              setState(() {});
            },
            value: 2,
            name: 'No',
          ),
        ],
      ),
    );
  }
}

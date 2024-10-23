import 'package:flutter/material.dart';
import 'package:mapstudio/app/widgets/buttons/text_radio_button.dart';
import 'package:mapstudio/common/constants/labels.dart';
import 'package:mapstudio/common/enums/radio_button_enum.dart';
import 'package:mapstudio/common/utils/sizer_util.dart';
import 'package:sizer/sizer.dart';

class SizeOfConnection extends StatefulWidget {
  const SizeOfConnection({super.key});

  @override
  State<SizeOfConnection> createState() => _SizeOfConnectionState();
}

class _SizeOfConnectionState extends State<SizeOfConnection> {
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
              'Size of Connection',
              style: AppLabels.frmLblTxtStyle,
            ),
          ),
          TextRadioButton(
            rbMode: RadioButtonEnum.sizeOfConnection,
            onPressed: () {
              setState(() {});
            },
            value: 1,
            name: '1/2',
          ),
          TextRadioButton(
            rbMode: RadioButtonEnum.sizeOfConnection,
            onPressed: () {
              setState(() {});
            },
            value: 2,
            name: '3/4',
          ),
          TextRadioButton(
            rbMode: RadioButtonEnum.sizeOfConnection,
            onPressed: () {
              setState(() {});
            },
            value: 3,
            name: 'others',
          ),
        ],
      ),
    );
  }
}

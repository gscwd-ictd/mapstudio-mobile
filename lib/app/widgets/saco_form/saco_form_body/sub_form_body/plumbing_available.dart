import 'package:flutter/material.dart';
import 'package:mapstudio/app/widgets/buttons/text_radio_button.dart';
import 'package:mapstudio/common/constants/labels.dart';
import 'package:mapstudio/common/enums/radio_button_enum.dart';
import 'package:sizer/sizer.dart';

class PlumbingAvavilable extends StatefulWidget {
  const PlumbingAvavilable({super.key});

  @override
  State<PlumbingAvavilable> createState() => _PlumbingAvavilableState();
}

class _PlumbingAvavilableState extends State<PlumbingAvavilable> {
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
              "Availability of Applicant's Plumbing Installation",
              style: AppLabels.frmLblTxtStyle,
            ),
          ),
          TextRadioButton(
            rbMode: RadioButtonEnum.plumbingAvail,
            onPressed: () {
              setState(() {});
            },
            value: 1,
            name: 'Yes',
          ),
          TextRadioButton(
            rbMode: RadioButtonEnum.plumbingAvail,
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

import 'package:flutter/material.dart';
import 'package:mapstudio/app/widgets/buttons/text_radio_button.dart';
import 'package:mapstudio/common/constants/labels.dart';
import 'package:mapstudio/common/enums/radio_button_enum.dart';

class PlumbingAvavilable extends StatefulWidget {
  const PlumbingAvavilable({super.key});

  @override
  State<PlumbingAvavilable> createState() => _PlumbingAvavilableState();
}

class _PlumbingAvavilableState extends State<PlumbingAvavilable> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            'Plumbing Installation Available?',
            style: AppLabels.frmLblTxtStyle,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
        )
      ],
    );
  }
}

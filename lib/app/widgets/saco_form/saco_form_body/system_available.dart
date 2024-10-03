import 'package:flutter/material.dart';
import 'package:mapstudio/app/widgets/buttons/text_radio_button.dart';
import 'package:mapstudio/common/utils/sizer_util.dart';

class SystemAvailable extends StatefulWidget {
  const SystemAvailable({super.key});

  @override
  State<SystemAvailable> createState() => _SystemAvailableState();
}

class _SystemAvailableState extends State<SystemAvailable> {
  int sysAvail = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'System Available?',
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextRadioButton(
              groupValue: sysAvail,
              value: 1,
              name: 'Yes',
            ),
            TextRadioButton(
              groupValue: sysAvail,
              value: 2,
              name: 'No',
            ),
          ],
        )
      ],
    );
  }
}

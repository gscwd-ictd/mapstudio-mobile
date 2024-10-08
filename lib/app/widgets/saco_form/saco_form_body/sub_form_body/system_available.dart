import 'package:flutter/material.dart';
import 'package:mapstudio/app/widgets/buttons/text_radio_button.dart';
import 'package:mapstudio/common/enums/radio_button_enum.dart';

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
          style: TextStyle(color: Colors.grey, fontSize: 11),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
        )
      ],
    );
  }
}

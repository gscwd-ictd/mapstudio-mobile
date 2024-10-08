import 'package:flutter/material.dart';
import 'package:mapstudio/app/widgets/buttons/text_radio_button.dart';
import 'package:mapstudio/common/enums/radio_button_enum.dart';
import 'package:mapstudio/common/utils/sizer_util.dart';

class SizeOfConnection extends StatefulWidget {
  const SizeOfConnection({super.key});

  @override
  State<SizeOfConnection> createState() => _SizeOfConnectionState();
}

class _SizeOfConnectionState extends State<SizeOfConnection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Size of Connection',
            style: TextStyle(color: Colors.grey, fontSize: 11),
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
          Row(
            children: [
              TextRadioButton(
                width: -1,
                rbMode: RadioButtonEnum.sizeOfConnection,
                onPressed: () {
                  setState(() {});
                },
                value: 3,
                name: 'others',
              ),
              SizedBox(
                width: SizerUtil.width(context) / 4,
                height: SizerUtil.height(context) / 34,
                child: TextFormField(
                  style: const TextStyle(fontSize: 10),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

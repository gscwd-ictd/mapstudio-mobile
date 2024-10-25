import 'package:flutter/material.dart';
import 'package:mapstudio/common/enums/saco_status_enum.dart';

// List<String> list = <String>[
//   'New Application',
//   'In Progress',
//   'Forwarded',
//   'Returned',
//   'Completed'
// ];

class SacoListDropDown extends StatefulWidget {
  const SacoListDropDown({super.key});

  @override
  State<SacoListDropDown> createState() => _SacoListDropDownState();
}

class _SacoListDropDownState extends State<SacoListDropDown> {
  // String dropdownValue = list.first;
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
      child: DropdownButton<String>(
        value: selectedOption,
        dropdownColor: Colors.white,
        underline: Container(),
        hint: const Text('Select Option'),
        items: <String>[
          'All',
          'New Application',
          'In Progress',
          'Forwarded',
          'Returned',
          'Completed'
        ].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.right,
            ),
          );
        }).toList(),
        onChanged: (newValue) {
          selectedOption = newValue!;
          setState(() {
            selectedOption;
          });
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mapstudio/common/utils/sizer_util.dart';

class BuildingType extends StatefulWidget {
  const BuildingType({super.key});

  @override
  State<BuildingType> createState() => _BuildingTypeState();
}

class _BuildingTypeState extends State<BuildingType> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Building Type',
            style: TextStyle(color: Colors.grey, fontSize: 11),
          ),
          Transform.scale(
            scale: 0.9,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8)),
              child: DropdownMenu(
                  width: SizerUtil.width(context) / 2,
                  trailingIcon: Transform.translate(
                    offset: const Offset(8, -12),
                    child: const Icon(
                      Icons.arrow_drop_down,
                      size: 25,
                    ),
                  ),
                  selectedTrailingIcon: Transform.translate(
                    offset: const Offset(8, -12),
                    child: const Icon(
                      Icons.arrow_drop_down,
                      size: 25,
                    ),
                  ),
                  textStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                  initialSelection: 'Government',
                  inputDecorationTheme: InputDecorationTheme(
                    isDense: true,
                    contentPadding: const EdgeInsets.only(left: 6),
                    constraints:
                        BoxConstraints.tight(const Size.fromHeight(25)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  dropdownMenuEntries: const <DropdownMenuEntry<String>>[
                    DropdownMenuEntry(value: 'Government', label: 'Government'),
                    DropdownMenuEntry(value: 'Private', label: 'Private'),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}

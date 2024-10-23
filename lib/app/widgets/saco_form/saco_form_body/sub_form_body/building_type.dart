import 'package:flutter/material.dart';
import 'package:mapstudio/app/widgets/buttons/custom_cbxButton.dart';
import 'package:mapstudio/common/constants/labels.dart';
import 'package:mapstudio/common/utils/cbx_button_util.dart';

class BuildingType extends StatefulWidget {
  const BuildingType({super.key});

  @override
  State<BuildingType> createState() => _BuildingTypeState();
}

class _BuildingTypeState extends State<BuildingType> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Building Type',
          style: AppLabels.frmLblTxtStyle,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
          child: const CustomCbxButton(
              items: ['Residential', 'Commercial', 'Government', 'Industrial'],
              hintText: 'Choose Building Type'),
        ),
        SizedBox(height: CbxButtonUtil.isCbxBuildTypeOpen ? 200 : 20),
      ],
    );
  }
}

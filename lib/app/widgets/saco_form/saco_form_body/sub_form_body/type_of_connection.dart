import 'package:flutter/material.dart';
import 'package:mapstudio/app/widgets/buttons/custom_cbxButton.dart';
import 'package:mapstudio/common/constants/labels.dart';
import 'package:mapstudio/common/utils/cbx_button_util.dart';
import 'package:sizer/sizer.dart';

class TypeOfConnection extends StatefulWidget {
  const TypeOfConnection({super.key});

  @override
  State<TypeOfConnection> createState() => _TypeOfConnectionState();
}

class _TypeOfConnectionState extends State<TypeOfConnection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Type of Connection',
            style: AppLabels.frmLblTxtStyle,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8)),
            child: const CustomCbxButton(
                items: ['Single', 'F-Type', 'Dual #1', 'Cluster'],
                hintText: 'Choose Type of Connection'),
          ),
        ],
      ),
    );
  }
}

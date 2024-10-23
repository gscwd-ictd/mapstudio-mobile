import 'package:flutter/material.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_body/sub_form_body/building_type.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_body/sub_form_body/estimates.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_body/sub_form_body/notes.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_body/sub_form_body/plumbing_available.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_body/sub_form_body/size_of_connection.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_body/sub_form_body/system_available.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_body/sub_form_body/type_of_connection.dart';
import 'package:mapstudio/common/constants/colors.dart';
import 'package:sizer/sizer.dart';

class SacoFormBody extends StatefulWidget {
  const SacoFormBody({super.key});

  @override
  State<SacoFormBody> createState() => _SacoFormBodyState();
}

class _SacoFormBodyState extends State<SacoFormBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h),
      child: const Card(
        elevation: 0,
        color: AppColors.bgColor,
        margin: null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SystemAvailable(),
            PlumbingAvavilable(),
            BuildingType(),
            SizeOfConnection(),
            TypeOfConnection(),
            Estimates(),
            Notes()
          ],
        ),
      ),
    );
  }
}

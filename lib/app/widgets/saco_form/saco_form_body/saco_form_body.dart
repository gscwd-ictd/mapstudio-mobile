import 'package:flutter/material.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_body/sub_form_body/building_type.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_body/sub_form_body/estimates.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_body/sub_form_body/notes.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_body/sub_form_body/plumbing_available.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_body/sub_form_body/size_of_connection.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_body/sub_form_body/system_available.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_body/sub_form_body/type_of_connection.dart';
import 'package:mapstudio/common/utils/sizer_util.dart';
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
      padding: EdgeInsets.symmetric(horizontal: 1.5.w),
      child: Card(
        elevation: 5,
        color: Colors.white,
        margin: null,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 35.h,
            width: 90.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 45.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SystemAvailable(),
                        SizedBox(
                            height: 15.h,
                            child: const Column(
                              children: [
                                BuildingType(),
                                TypeOfConnection(),
                              ],
                            )),
                        const Estimates()
                      ],
                    )),
                SizedBox(
                    width: 45.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const PlumbingAvavilable(),
                        SizedBox(height: 15.h, child: const SizeOfConnection()),
                        const Notes()
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

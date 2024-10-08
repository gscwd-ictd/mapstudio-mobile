import 'package:flutter/material.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_body/sub_form_body/building_type.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_body/sub_form_body/estimates.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_body/sub_form_body/notes.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_body/sub_form_body/plumbing_available.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_body/sub_form_body/size_of_connection.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_body/sub_form_body/system_available.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_body/sub_form_body/type_of_connection.dart';
import 'package:mapstudio/common/utils/sizer_util.dart';

class SacoFormBody extends StatefulWidget {
  const SacoFormBody({super.key});

  @override
  State<SacoFormBody> createState() => _SacoFormBodyState();
}

class _SacoFormBodyState extends State<SacoFormBody> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      margin: null,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: SizerUtil.width(context) / 2.2,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SystemAvailable(),
                        BuildingType(),
                        TypeOfConnection(),
                        Estimates()
                      ],
                    ),
                  )),
              SizedBox(
                  width: SizerUtil.width(context) / 2.2,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PlumbingAvavilable(),
                      SizeOfConnection(),
                      Notes()
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

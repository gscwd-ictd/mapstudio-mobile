import 'package:flutter/material.dart';
import 'package:mapstudio/common/utils/sizer_util.dart';
import 'package:mapstudio/common/utils/text_scale_util.dart';
import 'package:sizer/sizer.dart';

class SacoFormDetail extends StatefulWidget {
  const SacoFormDetail({super.key});

  @override
  State<SacoFormDetail> createState() => _SacoFormDetailState();
}

class _SacoFormDetailState extends State<SacoFormDetail> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('SACO Number',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textScaler:
                    TextScaler.linear(TextScaleUtil.textScaleFactor(context))),
            Padding(
              padding: EdgeInsets.only(left: 3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Applicant's Name",
                      style: TextStyle(fontSize: 15.sp, color: Colors.white),
                      textScaler: TextScaler.linear(
                          TextScaleUtil.textScaleFactor(context))),
                  Text("Applicant's Address",
                      style: TextStyle(fontSize: 15.sp, color: Colors.white),
                      textScaler: TextScaler.linear(
                          TextScaleUtil.textScaleFactor(context))),
                ],
              ),
            ),
          ],
        ),
        SizedBox(width: 25.w),
        Card(
            color: Colors.greenAccent,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Text('New',
                  style: TextStyle(fontSize: 14.sp),
                  textScaler: TextScaler.linear(
                      TextScaleUtil.textScaleFactor(context))),
            ))
      ],
    );
  }
}

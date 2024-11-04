import 'package:flutter/material.dart';
import 'package:mapstudio/common/constants/colors.dart';
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
    return Padding(
      padding: EdgeInsets.only(left: 4.w, bottom: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('SACO Number',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  textScaler: TextScaler.linear(
                      TextScaleUtil.textScaleFactor(context))),
              Padding(
                padding: EdgeInsets.only(left: 3.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Applicant's Name",
                        style: TextStyle(fontSize: 16.sp),
                        textScaler: TextScaler.linear(
                            TextScaleUtil.textScaleFactor(context))),
                    Text("Applicant's Address",
                        style: TextStyle(fontSize: 16.sp),
                        textScaler: TextScaler.linear(
                            TextScaleUtil.textScaleFactor(context))),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

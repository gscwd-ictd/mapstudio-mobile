import 'package:flutter/material.dart';
import 'package:mapstudio/common/constants/colors.dart';
import 'package:mapstudio/common/utils/text_scale_util.dart';
import 'package:sizer/sizer.dart';

import '../../../common/enums/saco_status_enum.dart';

class SacoFormDetail extends StatefulWidget {
  final String sacoNumber;
  final String applicantName;
  final String applicantAddress;
  final SacoStatus sacoStatus;

  const SacoFormDetail(
      {super.key,
      required this.sacoNumber,
      required this.applicantName,
      required this.applicantAddress,
      required this.sacoStatus});

  @override
  State<SacoFormDetail> createState() => _SacoFormDetailState();
}

class _SacoFormDetailState extends State<SacoFormDetail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4.w, bottom: 2.h),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.sacoNumber,
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                    textScaler: TextScaler.linear(
                        TextScaleUtil.textScaleFactor(context))),
                SizedBox(
                  width: 90.w,
                  child: Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.applicantName,
                            style: TextStyle(fontSize: 16.sp),
                            textScaler: TextScaler.linear(
                                TextScaleUtil.textScaleFactor(context))),
                        Text(widget.applicantAddress,
                            style: TextStyle(fontSize: 16.sp),
                            textScaler: TextScaler.linear(
                                TextScaleUtil.textScaleFactor(context))),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

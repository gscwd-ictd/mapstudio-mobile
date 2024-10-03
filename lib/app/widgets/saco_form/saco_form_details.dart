import 'package:flutter/material.dart';
import 'package:mapstudio/common/utils/sizer_util.dart';
import 'package:mapstudio/common/utils/text_scale_util.dart';

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
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textScaler:
                    TextScaler.linear(TextScaleUtil.textScaleFactor(context))),
            Padding(
              padding: EdgeInsets.only(left: SizerUtil.width(context) / 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Applicant's Name",
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                      textScaler: TextScaler.linear(
                          TextScaleUtil.textScaleFactor(context))),
                  Text("Applicant's Address",
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                      textScaler: TextScaler.linear(
                          TextScaleUtil.textScaleFactor(context))),
                ],
              ),
            ),
          ],
        ),
        SizedBox(width: SizerUtil.width(context) / 6),
        Card(
            color: Colors.greenAccent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Text('New',
                  style: const TextStyle(fontSize: 12),
                  textScaler: TextScaler.linear(
                      TextScaleUtil.textScaleFactor(context))),
            ))
      ],
    );
  }
}

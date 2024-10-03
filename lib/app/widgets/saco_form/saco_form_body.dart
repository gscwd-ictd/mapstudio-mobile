import 'package:flutter/material.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_body/system_available.dart';
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
      margin: null,
      child: SizedBox(
        width: SizerUtil.width(context) / 1.1,
        height: SizerUtil.width(context) / 4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                width: SizerUtil.width(context) / 2.2,
                child: const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [SystemAvailable()],
                  ),
                )),
            Container(
              color: Colors.amberAccent,
              child: SizedBox(
                  width: SizerUtil.width(context) / 2.2,
                  height: 100,
                  child: Column(
                    children: [],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

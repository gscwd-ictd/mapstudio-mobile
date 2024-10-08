import 'package:flutter/material.dart';

import '../../../../common/constants/colors.dart';
import '../../../../common/utils/sizer_util.dart';
import '../../../../common/utils/text_scale_util.dart';
import '../../../widgets/curved_navigation_bar/curved_navigation_bar.dart';

class SacoList extends StatefulWidget {
  const SacoList({super.key});

  @override
  State<SacoList> createState() => _SacoListState();
}

class _SacoListState extends State<SacoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppColors.mainColor,
      // ),
      bottomNavigationBar: const CurvedNavBar(),
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 4.5,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
                color: AppColors.mainColor,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hello, Mr. Surveryor",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                            textScaler: TextScaler.linear(
                                TextScaleUtil.textScaleFactor(context))),
                        Text("Umaagos na pagbati!",
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textScaler: TextScaler.linear(
                                TextScaleUtil.textScaleFactor(context))),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: const Image(
                      image: AssetImage('assets/images/sample_avatar.jpg'),
                      height: 100,
                      width: 100,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

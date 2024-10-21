import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mapstudio/common/enums/saco_status_enum.dart';
import '../../../../common/constants/colors.dart';
import '../../../../common/utils/text_scale_util.dart';
import '../../../widgets/curved_navigation_bar/curved_navigation_bar.dart';
import '../../../widgets/saco_list/saco_list_detail.dart';
import '../../../widgets/text_form/text_form.dart';

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
      backgroundColor: const Color.fromARGB(255, 237, 240, 245),
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 70, 10, 30),
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
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                                textScaler: TextScaler.linear(
                                    TextScaleUtil.textScaleFactor(context))),
                            Text("Umaagos na pagbati!",
                                style: const TextStyle(
                                    fontSize: 22,
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
                          height: 80,
                          width: 80,
                        ),
                      ),
                    ],
                  ),
                ),
                TextForm(
                  icon: FontAwesomeIcons.magnifyingGlass,
                ),
                SacoListDetail(
                  sacoNumber: '859682',
                  applicantName: 'Ricard Vicente Narvaiza',
                  applicantAddress:
                      '21 Prince Street Queenies Village General Santos City',
                  sacoStatus: SacoStatus.completed,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

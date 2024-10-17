import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mapstudio/app/widgets/buttons/default_button.dart';
import 'package:mapstudio/app/widgets/buttons/icon_circular_button.dart';
import 'package:mapstudio/app/widgets/curved_navigation_bar/curved_navigation_bar.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_body/saco_form_body.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_details.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_map.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_save_changes_modal.dart';
import 'package:mapstudio/app/widgets/text/button_text.dart';
import 'package:mapstudio/common/constants/colors.dart';
import 'package:mapstudio/common/utils/sizer_util.dart';
import 'package:mapstudio/common/utils/text_scale_util.dart';
import 'package:shadow_widget/shadow_widget.dart';
import 'package:sizer/sizer.dart';

class SacoForm extends StatefulWidget {
  const SacoForm({super.key});

  @override
  State<SacoForm> createState() => _SacoFormState();
}

class _SacoFormState extends State<SacoForm> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 16,
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 12.w, top: 2.h),
                child: Text("Inspection of Applicant's Information:",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textScaler: TextScaler.linear(
                        TextScaleUtil.textScaleFactor(context))),
              ),
              const Divider(
                color: Colors.white,
              ),
            ],
          ),
        ),
        bottomNavigationBar: const CurvedNavBar(),
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            SizedBox(
              height: 15.h,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60)),
                  color: AppColors.mainColor,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 2.h, bottom: 10.h),
                child: Column(
                  children: [
                    const SacoFormDetail(),
                    SacoFormMap(tileLayer: openStreetMapTileLayer),
                    const SacoFormBody(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const IconCircularButton(),
                          Padding(
                            padding: EdgeInsets.only(right: 4.w),
                            child: SizedBox(
                              height: 5.h,
                              child: DefaultButton(
                                buttonText: 'SAVE',
                                buttonWidth: 26.w,
                                onPressed: () {
                                  showDialog(
                                      barrierDismissible: false,
                                      barrierColor: const Color.fromRGBO(
                                          255, 255, 255, 80),
                                      context: context,
                                      builder: (context) =>
                                          const SacoSaveChangesModal());
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      tileDisplay: const TileDisplay.instantaneous(),
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );

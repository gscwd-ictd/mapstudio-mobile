import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:mapstudio/app/widgets/buttons/default_button.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_body/saco_form_body.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_details.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_form_map.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_save_changes_modal.dart';
import 'package:mapstudio/common/constants/colors.dart';
import 'package:mapstudio/common/utils/file_util.dart';
import 'package:mapstudio/common/utils/text_scale_util.dart';
import 'package:sizer/sizer.dart';

class SacoForm extends StatefulWidget {
  const SacoForm({super.key});

  @override
  State<SacoForm> createState() => _SacoFormState();
}

class _SacoFormState extends State<SacoForm> {
  double height = 15.h, posHeight = 5.h, pos = 1.h;
  @override
  void initState() {
    // TODO: implement initState
    animate();
    super.initState();
  }

  Future<void> animate() async {
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {
      pos = 6.h;
      posHeight = 20.h;
      height = 30.h;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 16,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            AnimatedSize(
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              child: SizedBox(
                height: height,
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
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              top: pos,
              left: 0,
              height: 20.h,
              width: 100.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 6.w, top: 2.h),
                    child: Text("Inspection of Applicant's Information:",
                        style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textScaler: TextScaler.linear(
                            TextScaleUtil.textScaleFactor(context))),
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  const SacoFormDetail(),
                ],
              ),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(bottom: 10.h, top: 22.h),
                child: Center(
                  child: Column(
                    children: [
                      SacoFormMap(tileLayer: openStreetMapTileLayer),
                      const SacoFormBody(),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: SizedBox(
                  height: 6.h,
                  child: DefaultButton(
                    buttonText: 'SAVE',
                    buttonWidth: 38.w,
                    onPressed: () {
                      showDialog(
                          barrierDismissible: false,
                          // barrierColor: const Color.fromRGBO(255, 255, 255, 80),
                          // ignore: use_build_context_synchronously
                          context: context,
                          builder: (context) => SacoSaveChangesModal(
                              tileLayer: openStreetMapTileLayer));
                    },
                  ),
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

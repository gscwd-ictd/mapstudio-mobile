import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mapstudio/app/widgets/buttons/default_button.dart';
import 'package:mapstudio/app/widgets/text/button_text.dart';
import 'package:mapstudio/common/constants/colors.dart';
import 'package:mapstudio/common/utils/sizer_util.dart';
import 'package:sizer/sizer.dart';

class SacoReturnedModal extends StatefulWidget {
  final TileLayer tileLayer;
  const SacoReturnedModal({super.key, required this.tileLayer});

  @override
  State<SacoReturnedModal> createState() => _SacoReturnedModalState();
}

class _SacoReturnedModalState extends State<SacoReturnedModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Dialog(
        shadowColor: Colors.black,
        elevation: 20,
        insetPadding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 4.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
                colors: [
                  AppColors.abortColor,
                  Color(0xFFFFFFFF),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(0, 1),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          height: 50.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'Returned to GCC',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22.sp, color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.h, right: 4.w),
                child: Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SACO Number',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 0.4.h,
                            ),
                            Text(
                              "Applicant's Name",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            SizedBox(
                              height: 0.1.h,
                            ),
                            Text(
                              "Applicant's Address",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            SizedBox(
                              height: 0.4.h,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide.none,
                                    borderRadius: BorderRadius.circular(20)),
                                child: SizedBox(
                                  height: 22.h,
                                  width: 78.w,
                                  child: FlutterMap(
                                      options: const MapOptions(
                                        initialCenter:
                                            LatLng(6.12562, 125.18451),
                                        initialZoom: 17,
                                        minZoom: 12,
                                        maxZoom: 20,
                                        interactionOptions: InteractionOptions(
                                            flags:
                                                ~InteractiveFlag.doubleTapZoom),
                                      ),
                                      children: [widget.tileLayer]),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 0.4.h,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      SizedBox(
                        height: 5.h,
                        child: DefaultButton(
                            btnColor: AppColors.abortColor,
                            radius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: AppColors.abortColor, width: 2),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                            buttonText: 'OKAY',
                            buttonWidth: 5.w),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

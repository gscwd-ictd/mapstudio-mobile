import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mapstudio/app/widgets/buttons/default_button.dart';
import 'package:mapstudio/app/widgets/drawing/triangle_drawing.dart';
import 'package:mapstudio/common/constants/colors.dart';
import 'package:mapstudio/common/utils/marker_util.dart';
import 'package:sizer/sizer.dart';

Marker createMarker(
    {required LatLng position,
    required String sacoNumber,
    required String name,
    required String address,
    required Function ontap,
    required Function onYesTap}) {
  return Marker(
    width: MarkerUtil.currentMarkerTap == position ? 80.w : 60,
    height: MarkerUtil.currentMarkerTap == position ? 30.h : 80,
    alignment: MarkerUtil.currentMarkerTap == position
        ? const Alignment(-0.74, -0.03)
        : null,
    point: position,
    child: GestureDetector(
      onTap: () {
        print(MarkerUtil.currentMarkerTap);
        ontap();
      },
      child: Column(
        children: [
          MarkerUtil.currentMarkerTap == position
              ? Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.mainColor, width: 2),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(sacoNumber,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('APPLICANT NAME'),
                                const Text('ADDRESS'),
                                SizedBox(height: 2.h)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                DefaultButton(
                                  onPressed: () {
                                    onYesTap();
                                  },
                                  buttonText: 'ACCEPT',
                                  buttonWidth: 12.w,
                                  txtSize: 15.sp,
                                ),
                                DefaultButton(
                                  onPressed: () {},
                                  buttonText: 'DECLINE',
                                  buttonWidth: 0.6.w,
                                  btnColor: Colors.white,
                                  txtColor: AppColors.lblColor,
                                  txtSize: 16.sp,
                                  borderSide: const BorderSide(
                                      color: AppColors.mainColor, width: 0.8),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Transform.translate(
                        offset: const Offset(250, 116),
                        child: SizedBox(
                          height: 2.h,
                          child: CustomPaint(
                            size: const Size(20, 10),
                            painter: TrianglePainter(),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox(
                  width: 60,
                  height: 80,
                  child: Image.asset('assets/images/pin_surveyor.png'))
        ],
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mapstudio/common/enums/saco_status_enum.dart';
import 'package:mapstudio/common/utils/marker_util.dart';

Marker createMarker(
    {required LatLng position,
    required String sacoNumber,
    required String name,
    required String address,
    required SacoStatus sacoStatus,
    required Function ontap,
    required Function onYesTap,
    required Function onNoTap}) {
  return Marker(
    width: MarkerUtil.currentMarkerTap == position ? 80 : 80,
    height: MarkerUtil.currentMarkerTap == position ? 80 : 80,
    //     width: MarkerUtil.currentMarkerTap == position ? 80.w : 60,
    // height: MarkerUtil.currentMarkerTap == position ? 30.h : 80,
    alignment: MarkerUtil.currentMarkerTap == position
        ? null
        // const Alignment(-0.74, -0.03)
        : null,
    point: position,
    child: GestureDetector(
      onTap: () {
        // print(MarkerUtil.currentMarkerTap);
        ontap();
      },
      child: Column(
        children: [
          SizedBox(
              width: 60,
              height: 80,
              child: sacoStatus == SacoStatus.newapplication
                  ? Image.asset('assets/images/surveyPin_new.png')
                  : sacoStatus == SacoStatus.inprogress
                      ? Image.asset('assets/images/surveyPin_inProgress.png')
                      : sacoStatus == SacoStatus.forwarded
                          ? Image.asset('assets/images/surveyPin_forwarded.png')
                          : sacoStatus == SacoStatus.returned
                              ? Image.asset(
                                  'assets/images/surveyPin_returned.png')
                              : sacoStatus == SacoStatus.completed
                                  ? Image.asset(
                                      'assets/images/surveyPin_completed.png')
                                  : Image.asset(
                                      'assets/images/surveyPin_completed.png'))
          // MarkerUtil.currentMarkerTap == position
          //     ?

          // Container(
          //     padding: const EdgeInsets.all(8),
          //     margin: const EdgeInsets.only(bottom: 8),
          //     decoration: BoxDecoration(
          //       border: Border.all(color: AppColors.mainColor, width: 2),
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(8),
          //       boxShadow: const [
          //         BoxShadow(
          //           color: Colors.black26,
          //           blurRadius: 6,
          //         ),
          //       ],
          //     ),
          //     child:
          // Stack(
          //       children: [
          //         Column(
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Text(sacoNumber,
          //                     style: const TextStyle(
          //                         fontWeight: FontWeight.bold)),
          //                 SacoStatusLabel(
          //                   status: sacoStatus,
          //                   txtStatus: 10,
          //                 ),
          //               ],
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.only(left: 8),
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text(name),
          //                   Text(address),
          //                   SizedBox(height: 2.h)
          //                 ],
          //               ),
          //             ),
          //             SizedBox(
          //               height: 5.h,
          //               child: sacoStatus == SacoStatus.newapplication
          //                   ? Row(
          //                       mainAxisAlignment:
          //                           MainAxisAlignment.spaceAround,
          //                       children: [
          //                         DefaultButton(
          //                           onPressed: () {
          //                             onYesTap();
          //                           },
          //                           buttonText: 'ACCEPT',
          //                           buttonWidth: 0.6.w,
          //                           txtSize: 14.sp,
          //                         ),
          //                         DefaultButton(
          //                           onPressed: () {
          //                             onNoTap();
          //                           },
          //                           buttonText: 'DECLINE',
          //                           buttonWidth: 0.6.w,
          //                           btnColor: Colors.white,
          //                           txtColor: AppColors.lblColor,
          //                           txtSize: 14.sp,
          //                           borderSide: const BorderSide(
          //                               color: AppColors.mainColor,
          //                               width: 0.8),
          //                         ),
          //                         DefaultButton(
          //                           onPressed: () {
          //                             onNoTap();
          //                           },
          //                           buttonText: 'CLOSE',
          //                           buttonWidth: 0.6.w,
          //                           btnColor: Colors.white,
          //                           txtColor: AppColors.lblColor,
          //                           txtSize: 14.sp,
          //                           borderSide: const BorderSide(
          //                               color: AppColors.mainColor,
          //                               width: 0.8),
          //                         )
          //                       ],
          //                     )
          //                   : sacoStatus == SacoStatus.inprogress
          //                       ? Row(
          //                           mainAxisAlignment:
          //                               MainAxisAlignment.spaceAround,
          //                           children: [
          //                             DefaultButton(
          //                               onPressed: () {
          //                                 onYesTap();
          //                               },
          //                               buttonText: 'ACCEPT',
          //                               buttonWidth: 0.6.w,
          //                               txtSize: 14.sp,
          //                             ),
          //                             DefaultButton(
          //                               onPressed: () {
          //                                 onNoTap();
          //                               },
          //                               buttonText: 'DECLINE',
          //                               buttonWidth: 0.6.w,
          //                               btnColor: Colors.white,
          //                               txtColor: AppColors.lblColor,
          //                               txtSize: 14.sp,
          //                               borderSide: const BorderSide(
          //                                   color: AppColors.mainColor,
          //                                   width: 0.8),
          //                             ),
          //                             DefaultButton(
          //                               onPressed: () {
          //                                 onNoTap();
          //                               },
          //                               buttonText: 'CLOSE',
          //                               buttonWidth: 0.6.w,
          //                               btnColor: Colors.white,
          //                               txtColor: AppColors.lblColor,
          //                               txtSize: 14.sp,
          //                               borderSide: const BorderSide(
          //                                   color: AppColors.mainColor,
          //                                   width: 0.8),
          //                             )
          //                           ],
          //                         )
          //                       : Row(
          //                           mainAxisAlignment:
          //                               MainAxisAlignment.end,
          //                           children: [
          //                             DefaultButton(
          //                               onPressed: () {
          //                                 onNoTap();
          //                               },
          //                               buttonText: 'CLOSE',
          //                               buttonWidth: 0.6.w,
          //                               btnColor: Colors.white,
          //                               txtColor: AppColors.lblColor,
          //                               txtSize: 15.sp,
          //                               borderSide: const BorderSide(
          //                                   color: AppColors.mainColor,
          //                                   width: 0.8),
          //                             )
          //                           ],
          //                         ),
          //             ),
          //           ],
          //         ),
          //         Transform.translate(
          //           offset: const Offset(250, 116),
          //           child: SizedBox(
          //             height: 2.h,
          //             child: CustomPaint(
          //               size: const Size(20, 10),
          //               painter: TrianglePainter(),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   )
          // : SizedBox(
          //     width: 60,
          //     height: 80,
          //     child: sacoStatus == SacoStatus.newapplication
          //         ? Image.asset('assets/images/surveyPin_new.png')
          //         : sacoStatus == SacoStatus.inprogress
          //             ? Image.asset(
          //                 'assets/images/surveyPin_inProgress.png')
          //             : sacoStatus == SacoStatus.forwarded
          //                 ? Image.asset(
          //                     'assets/images/surveyPin_forwarded.png')
          //                 : sacoStatus == SacoStatus.returned
          //                     ? Image.asset(
          //                         'assets/images/surveyPin_returned.png')
          //                     : sacoStatus == SacoStatus.completed
          //                         ? Image.asset(
          //                             'assets/images/surveyPin_completed.png')
          //                         : Image.asset(
          //                             'assets/images/surveyPin_completed.png'))
        ],
      ),
    ),
  );
}

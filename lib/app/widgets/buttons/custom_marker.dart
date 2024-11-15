import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mapstudio/common/utils/marker_util.dart';
import 'package:sizer/sizer.dart';

Marker createMarker(
    {required LatLng position,
    required String sacoNumber,
    required String name,
    required String address,
    required Function ontap}) {
  return Marker(
    width: MarkerUtil.currentMarkerTap == position ? 80.w : 60,
    height: MarkerUtil.currentMarkerTap == position ? 30.h : 80,
    alignment: MarkerUtil.currentMarkerTap == position
        ? const Alignment(0, -0.45)
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(sacoNumber,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text('APPLICANT NAME'),
                      Text('ADDRESS'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Accept action
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue, // Background color
                            ),
                            child: const Text("ACCEPT"),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              // Decline action
                            },
                            child: const Text("DECLINE"),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : Container(),
          SizedBox(
              width: 60,
              height: 80,
              child: Image.asset('assets/images/pin_surveyor.png')),
        ],
      ),
    ),
  );
}

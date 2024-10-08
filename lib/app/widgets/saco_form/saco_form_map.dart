import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mapstudio/common/utils/sizer_util.dart';
import 'package:shadow_widget/shadow_widget.dart';

class SacoFormMap extends StatefulWidget {
  final TileLayer tileLayer;
  const SacoFormMap({super.key, required this.tileLayer});

  @override
  State<SacoFormMap> createState() => _SacoFormMapState();
}

class _SacoFormMapState extends State<SacoFormMap> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizerUtil.height(context) / 80, bottom: 4),
      child: ShadowWidget(
        blurRadius: 5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: SizerUtil.height(context) / 3,
            width: SizerUtil.width(context) / 1.1,
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                FlutterMap(
                    options: const MapOptions(
                      initialCenter: LatLng(6.12562, 125.18451),
                      initialZoom: 17,
                      minZoom: 12,
                      maxZoom: 20,
                      interactionOptions: InteractionOptions(
                          flags: ~InteractiveFlag.doubleTapZoom),
                    ),
                    children: [widget.tileLayer]),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10)),
                      onPressed: () {},
                      child: const Icon(
                        Icons.my_location,
                        color: Colors.blue,
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

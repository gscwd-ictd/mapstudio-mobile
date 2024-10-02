import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mapstudio/app/widgets/saco_form_details/saco_form_details.dart';
import 'package:mapstudio/common/constants/colors.dart';
import 'package:mapstudio/common/utils/sizer_util.dart';
import 'package:mapstudio/common/utils/text_scale_util.dart';
import 'package:shadow_widget/shadow_widget.dart';

class SacoForm extends StatefulWidget {
  const SacoForm({super.key});

  @override
  State<SacoForm> createState() => _SacoFormState();
}

class _SacoFormState extends State<SacoForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
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
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(right: SizerUtil.width(context) / 12),
                  child: Text("Inspection of Applicant's Information:",
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textScaler: TextScaler.linear(
                          TextScaleUtil.textScaleFactor(context))),
                ),
                const Divider(
                  color: Colors.white,
                ),
                const SacoFormDetail(),
                Padding(
                  padding: EdgeInsets.only(top: SizerUtil.height(context) / 30),
                  child: ShadowWidget(
                    blurRadius: 5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: SizerUtil.height(context) / 2.5,
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
                                children: [openStreetMapTileLayer]),
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      tileDisplay: const TileDisplay.instantaneous(),
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );

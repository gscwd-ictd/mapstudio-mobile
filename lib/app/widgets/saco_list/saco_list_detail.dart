// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mapstudio/app/screens/saco/saco_form/saco_form.dart';
import 'package:mapstudio/app/screens/saco/saco_map/saco_map.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_accept_request_modal.dart';
import 'package:mapstudio/app/widgets/saco_form/saco_returned_modal.dart';
import 'package:mapstudio/app/widgets/saco_list/saco_list_status.dart';
import 'package:sizer/sizer.dart';

import '../../../common/enums/saco_status_enum.dart';
import '../../../data/models/pfdf_model.dart';

// ignore: must_be_immutable
class SacoListDetail extends StatefulWidget {
  String sacoNumber;
  String applicantName;
  String applicantAddress;
  SacoStatus sacoStatus;
  List<PfdfModel> pfdf;
  final double latitude;
  final double longitude;

  SacoListDetail({
    super.key,
    required this.sacoNumber,
    required this.applicantName,
    required this.applicantAddress,
    required this.sacoStatus,
    required this.pfdf,
    required this.latitude,
    required this.longitude,
  });

  @override
  State<SacoListDetail> createState() => _SacoListDetailState();
}

class _SacoListDetailState extends State<SacoListDetail>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.sacoStatus == SacoStatus.newapplication
          ? () {
              showDialog(
                  barrierDismissible: false,
                  // ignore: use_build_context_synchronously
                  context: context,
                  builder: (context) => Container(
                        color:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                        child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: SacoAcceptRequestModal(
                              tileLayer: openStreetMapTileLayer,
                              latitude: widget.latitude,
                              longitude: widget.longitude,
                              sacoNumber: widget.sacoNumber,
                              applicantName: widget.applicantName,
                              applicantAddress: widget.applicantAddress,
                              sacoStatus: widget.sacoStatus,
                            )),
                      ));
            }
          : () {
              // Navigator.of(context).pop();
              showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  isDismissible: false,
                  useRootNavigator: true,
                  builder: (BuildContext context) {
                    return Container(
                      color:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        child: DraggableScrollableSheet(
                            expand: false,
                            snap: false,
                            builder: (_, controller) {
                              return SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  controller: controller,
                                  child: SizedBox(
                                      height: 120.h,
                                      child: SacoForm(
                                        sacoNumber: widget.sacoNumber,
                                        applicantName: widget.applicantName,
                                        applicantAddress:
                                            widget.applicantAddress,
                                        sacoStatus: widget.sacoStatus,
                                        latitude: widget.latitude,
                                        longitude: widget.longitude,
                                        pfdf: widget.pfdf,
                                      )));
                            }),
                      ),
                    );
                  });
            },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            width: 2,
            color: Color.fromARGB(255, 237, 240, 245),
          ))),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 8, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Text(
                            widget.sacoNumber,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SacoStatusLabel(
                      status: widget.sacoStatus,
                      txtStatus: 12,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 8, 0),
                            child: Text(
                              widget.applicantName,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 8, 20),
                            child: Text(
                              widget.applicantAddress,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

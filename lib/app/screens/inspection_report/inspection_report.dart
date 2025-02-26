import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mapstudio/common/enums/saco_status_enum.dart';
import 'package:mapstudio/data/models/pfdf_model.dart';
import 'package:sizer/sizer.dart';
import '../../../../common/constants/colors.dart';
import '../../widgets/buttons/default_button.dart';
import '../../widgets/inspection_report/inspection_report_map.dart';
import '../../widgets/inspection_report/saco_form_label.dart';
import '../../widgets/saco_form/saco_saved_modal.dart';

class InspectionReport extends StatefulWidget {
  final List<PfdfModel> pfdf;
  final String sacoNumber;
  final String applicantName;
  final String applicantAddress;
  final SacoStatus sacoStatus;
  final double applicantLatitude;
  final double applicantLongitude;

  const InspectionReport(
      {super.key,
      required this.pfdf,
      required this.sacoNumber,
      required this.applicantName,
      required this.applicantAddress,
      required this.sacoStatus,
      required this.applicantLatitude,
      required this.applicantLongitude});

  @override
  State<InspectionReport> createState() => _InspectionReportState();
}

class _InspectionReportState extends State<InspectionReport> {
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.mainColor,
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recommend for Approval',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
              child: Text(
                'Please review inspection Report and PFDF',
                style: TextStyle(
                    fontSize: 8,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 22,
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Container(
                      width: 100.w,
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color.fromARGB(255, 240, 238, 238))),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Text(
                              'INSPECTION REPORT',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InspectionReportMap(
                      tileLayer: openStreetMapTileLayer,
                      sacoNumber: widget.sacoNumber,
                      applicantName: widget.applicantName,
                      applicantAddress: widget.applicantAddress,
                      latitude: widget.applicantLatitude,
                      longitude: widget.applicantLongitude,
                    ),
                    const SacoFormLabelAndEntry(
                      label: 'System is Available',
                      entry: 'Yes',
                    ),
                    const SacoFormLabelAndEntry(
                      label: 'Plumbing Installation is Available',
                      entry: 'Yes',
                    ),
                    const SacoFormLabelAndEntry(
                      label: 'Building Type',
                      entry: 'Residential',
                    ),
                    const SacoFormLabelAndEntry(
                      label: 'Size of Connection',
                      entry: '1/2',
                    ),
                    const SacoFormLabelAndEntry(
                      label: 'Type of Connection',
                      entry: 'Dual #1',
                    ),
                    const SacoFormLabelAndEntry(
                      label: 'Estimates',
                      entry: '75 x 25 x 8m',
                    ),
                    const SacoFormLabelAndEntry(
                      label: 'Notes',
                      entry: '2pcs PVC casing',
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 100.w,
                      decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                color: Color.fromARGB(255, 240, 238, 238)),
                            bottom: BorderSide(
                                color: Color.fromARGB(255, 240, 238, 238))),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Text(
                              'PFDF',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: SizedBox(
                        height: 300,
                        child: ListView.builder(
                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 20),
                            itemCount: widget.pfdf.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                    child: SizedBox(
                                      width: 30,
                                      child: Text(
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                          '${widget.pfdf[index].fixtureCount}'),
                                    ),
                                  ),
                                  Text(widget.pfdf[index].fixtureName),
                                ],
                              );
                            }),
                      ),
                    )
                  ]))),
          Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: SizedBox(
                  height: 6.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultButton(
                        btnColor: AppColors.bgColor,
                        txtColor: AppColors.lblColor,
                        radius: BorderRadius.circular(8),
                        buttonText: 'DISAPPROVE',
                        buttonWidth: 5.w,
                        onPressed: () {
                          Navigator.of(context).push(
                              // ignore: use_build_context_synchronously
                              PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              // Navigate to the SecondScreen
                              return const SacoSavedModal();
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              var tween = Tween<double>(begin: 0.0, end: 1)
                                  .animate(animation);
                              return FadeTransition(
                                opacity: tween,
                                // Apply slide transition
                                child: child,
                              );
                            },
                          ));
                        },
                      ),
                      DefaultButton(
                        radius: BorderRadius.circular(8),
                        buttonText: 'APPROVE',
                        buttonWidth: 10.w,
                        onPressed: () {
                          Navigator.of(context).push(
                              // ignore: use_build_context_synchronously
                              PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              // Navigate to the SecondScreen
                              return const SacoSavedModal();
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              var tween = Tween<double>(begin: 0.0, end: 1)
                                  .animate(animation);
                              return FadeTransition(
                                opacity: tween,
                                // Apply slide transition
                                child: child,
                              );
                            },
                          ));
                        },
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  GestureDetector fixtureButton(
      {required String btn,
      required IconData icon,
      required Color clrIcon,
      required clrText,
      required Function onTap}) {
    return GestureDetector(
        onTap: () {
          onTap();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FaIcon(icon, color: clrIcon
                // FontAwesomeIcons.penToSquare,
                // color: Colors.grey[500],
                ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 3, 0, 0),
              child: Text(
                btn,
                style: TextStyle(
                    color: clrText,
                    // color: Colors.grey[500],
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ));
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'com.android.application',
    );

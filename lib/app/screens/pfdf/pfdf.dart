import 'package:flutter/material.dart';
import 'package:mapstudio/common/enums/saco_status_enum.dart';
import 'package:mapstudio/data/models/pfdf_model.dart';
import '../../../../common/constants/colors.dart';
import '../../widgets/pfdf/pfdf_list_detail.dart';

class Pfdf extends StatefulWidget {
  final List<PfdfModel> pfdf;
  final String sacoNumber;
  final String applicantName;
  final String applicantAddress;
  final SacoStatus sacoStatus;

  const Pfdf(
      {super.key,
      required this.pfdf,
      required this.sacoNumber,
      required this.applicantName,
      required this.applicantAddress,
      required this.sacoStatus});

  @override
  State<Pfdf> createState() => _PfdfState();
}

class _PfdfState extends State<Pfdf> {
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
              'Plumbing Fixtures Declaration Form (PFDF)',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
              child: Text(
                'Please verify all listed pumbing fixtures.',
                style: TextStyle(
                    fontSize: 8,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 20),
              itemCount: widget.pfdf.length,
              itemBuilder: (context, index) {
                return PfdfListDetail(
                  fixtureCount: widget.pfdf[index].fixtureCount,
                  fixtureName: widget.pfdf[index].fixtureName,
                  fixtureDesc: widget.pfdf[index].fixtureDesc,
                  fixtureImage: widget.pfdf[index].fixtureImage,
                );
              })
        ],
      ),
    );
  }
}

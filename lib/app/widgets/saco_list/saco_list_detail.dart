// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mapstudio/app/widgets/saco_list/saco_list_status.dart';

import '../../../common/enums/saco_status_enum.dart';

// ignore: must_be_immutable
class SacoListDetail extends StatefulWidget {
  String sacoNumber;
  String applicantName;
  String applicantAddress;
  SacoStatus sacoStatus;

  SacoListDetail({
    super.key,
    required this.sacoNumber,
    required this.applicantName,
    required this.applicantAddress,
    required this.sacoStatus,
  });

  @override
  State<SacoListDetail> createState() => _SacoListDetailState();
}

class _SacoListDetailState extends State<SacoListDetail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.sacoNumber,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    widget.applicantName,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
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
          Expanded(
              flex: 1,
              child: SacoStatusLabel(
                status: widget.sacoStatus,
              ))
        ],
      ),
    );
  }
}

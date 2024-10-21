// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../common/enums/saco_status_enum.dart';

// ignore: must_be_immutable
class SacoStatusLabel extends StatefulWidget {
  final SacoStatus status;

  const SacoStatusLabel({
    super.key,
    required this.status,
  });

  @override
  State<SacoStatusLabel> createState() => _SacoStatusLabelState();
}

class _SacoStatusLabelState extends State<SacoStatusLabel> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            border: Border.fromBorderSide(
                BorderSide(color: Color.fromARGB(255, 204, 204, 204)))),
        child: Text('${widget.status}'));
  }
}

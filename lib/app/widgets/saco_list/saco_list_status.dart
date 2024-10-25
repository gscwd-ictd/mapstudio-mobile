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
        decoration: BoxDecoration(
          color: widget.status == SacoStatus.newapplication
              ? const Color.fromARGB(255, 176, 255, 157)
              : widget.status == SacoStatus.inprogress
                  ? const Color.fromARGB(255, 255, 235, 153)
                  : widget.status == SacoStatus.forwarded
                      ? const Color.fromARGB(255, 255, 181, 132)
                      : widget.status == SacoStatus.returned
                          ? const Color.fromARGB(255, 219, 88, 86)
                          : widget.status == SacoStatus.completed
                              ? const Color.fromARGB(255, 37, 99, 235)
                              : Colors.amberAccent,
          borderRadius: const BorderRadius.all(Radius.circular(50)),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
          child: Text(
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: widget.status == SacoStatus.returned ||
                          widget.status == SacoStatus.completed
                      ? Colors.white
                      : Colors.black),
              textAlign: TextAlign.center,
              widget.status == SacoStatus.newapplication
                  ? 'New'
                  : widget.status == SacoStatus.inprogress
                      ? 'In Progress'
                      : widget.status == SacoStatus.forwarded
                          ? 'Forwarded'
                          : widget.status == SacoStatus.returned
                              ? 'Returned'
                              : widget.status == SacoStatus.completed
                                  ? 'Completed'
                                  : '${widget.status}'),
        ));
  }
}

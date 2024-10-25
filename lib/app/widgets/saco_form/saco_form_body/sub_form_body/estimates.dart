import 'package:flutter/material.dart';
import 'package:mapstudio/common/constants/labels.dart';
import 'package:mapstudio/common/utils/sizer_util.dart';
import 'package:sizer/sizer.dart';

class Estimates extends StatefulWidget {
  const Estimates({super.key});

  @override
  State<Estimates> createState() => _EstimatesState();
}

class _EstimatesState extends State<Estimates> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Estimates',
            style: AppLabels.frmLblTxtStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(
              width: 40.w,
              child: TextFormField(
                style: const TextStyle(fontSize: 10),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                  ),
                ),
                maxLines: 3,
              ),
            ),
          )
        ],
      ),
    );
  }
}

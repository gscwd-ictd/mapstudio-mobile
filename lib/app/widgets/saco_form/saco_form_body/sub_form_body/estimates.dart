import 'package:flutter/material.dart';
import 'package:mapstudio/common/utils/sizer_util.dart';

class Estimates extends StatefulWidget {
  const Estimates({super.key});

  @override
  State<Estimates> createState() => _EstimatesState();
}

class _EstimatesState extends State<Estimates> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Estimates',
            style: TextStyle(color: Colors.grey, fontSize: 11),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(
              width: SizerUtil.width(context) / 2.5,
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

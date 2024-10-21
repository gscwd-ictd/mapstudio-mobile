// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextForm extends StatefulWidget {
  IconData icon;
  TextForm({
    super.key,
    required this.icon,
  });

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            border: Border.fromBorderSide(
                BorderSide(color: Color.fromARGB(255, 204, 204, 204)))),
        child: TextFormField(
          style: const TextStyle(fontSize: 20),
          decoration: InputDecoration(
              hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 204, 204, 204),
                  fontWeight: FontWeight.w400),
              hintText: "Search",
              border: InputBorder.none,
              prefixIcon: Icon(widget.icon)),
        ),
      ),
    );
  }
}

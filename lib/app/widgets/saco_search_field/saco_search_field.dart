// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapstudio/domain/blocs/saco_dashboard_bloc/saco_dashboard_bloc.dart';

import '../../../domain/blocs/saco_dashboard_bloc/saco_dashboard_event.dart';

// ignore: must_be_immutable
class SacoSearchField extends StatefulWidget {
  IconData icon;
  SacoSearchField({
    super.key,
    required this.icon,
  });

  @override
  State<SacoSearchField> createState() => _SacoSearchFieldState();
}

class _SacoSearchFieldState extends State<SacoSearchField> {
  @override
  Widget build(BuildContext context) {
    final sacoDashboardBloc = BlocProvider.of<SacoDashboardBloc>(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            border: Border.fromBorderSide(
                BorderSide(color: Color.fromARGB(255, 204, 204, 204)))),
        child: TextFormField(
          onChanged: (text) {
            sacoDashboardBloc.add(UpdateSacoDashboard(
                search: text,
                selectedStatus: sacoDashboardBloc.state.selectedStatus));
          },
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapstudio/common/enums/saco_status_enum.dart';

import '../../../domain/blocs/geolocation_bloc/geolocation_bloc.dart';
import '../../../domain/blocs/map_route_bloc/map_route_bloc.dart';
import '../../../domain/blocs/saco_dashboard_bloc/saco_dashboard_bloc.dart';
import '../../../domain/blocs/saco_dashboard_bloc/saco_dashboard_event.dart';

// List<String> list = <String>[
//   'New Application',
//   'In Progress',
//   'Forwarded',
//   'Returned',
//   'Completed'
// ];

class SacoListDropDown extends StatefulWidget {
  const SacoListDropDown({super.key});

  @override
  State<SacoListDropDown> createState() => _SacoListDropDownState();
}

class _SacoListDropDownState extends State<SacoListDropDown> {
  // String dropdownValue = list.first;
  String? selectedOption = 'All';

  @override
  Widget build(BuildContext context) {
    final sacoDashboardBloc = BlocProvider.of<SacoDashboardBloc>(context);
    final mapRouteBloc = BlocProvider.of<MapRouteBloc>(context);
    final geoLocationBloc = BlocProvider.of<GeolocationBloc>(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
      child: DropdownButton<String>(
        value: selectedOption,
        dropdownColor: Colors.white,
        underline: Container(),
        hint: const Text('Select Option'),
        items: <String>[
          'All',
          'New',
          'In Progress',
          'Forwarded',
          'Returned',
          'Completed'
        ].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.right,
            ),
          );
        }).toList(),
        onChanged: (newValue) {
          SacoStatus newStatus = SacoStatus.all;
          //reset polylines/routing in map when saco status dropdown is change in dashboard
          mapRouteBloc.add(GetMapRouteRequest(
              startingPoint:
                  '${geoLocationBloc.state.currentLongitude}, ${geoLocationBloc.state.currentLatitude}',
              destinationPoint:
                  '${geoLocationBloc.state.currentLatitude}, ${geoLocationBloc.state.currentLongitude}'));
          switch (newValue) {
            case 'All':
              newStatus = SacoStatus.all;
            case 'New':
              newStatus = SacoStatus.newapplication;
            case 'In Progress':
              newStatus = SacoStatus.inprogress;
            case 'Forwarded':
              newStatus = SacoStatus.forwarded;
            case 'Returned':
              newStatus = SacoStatus.returned;
            case 'Completed':
              newStatus = SacoStatus.completed;
          }

          sacoDashboardBloc.add(UpdateSacoDashboard(
              search: sacoDashboardBloc.state.search,
              selectedStatus: newStatus));
          selectedOption = newValue!;
          setState(() {
            selectedOption = newValue;
          });
        },
      ),
    );
  }
}

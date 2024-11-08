import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapstudio/common/enums/saco_status_enum.dart';
import 'package:mapstudio/data/models/saco_list_model.dart';
import 'package:mapstudio/domain/blocs/saco_dashboard_bloc/saco_dashboard_state.dart';
import 'package:sizer/sizer.dart';
import '../../../../common/constants/colors.dart';
import '../../../../common/utils/text_scale_util.dart';
import '../../../../domain/blocs/saco_dashboard_bloc/saco_dashboard_bloc.dart';
import '../../../widgets/curved_navigation_bar/curved_navigation_bar.dart';
import '../../../widgets/saco_list/saco_list_detail.dart';
import '../../../widgets/saco_list/saco_list_dropdown.dart';

class SacoDashboard extends StatefulWidget {
  final List<SacoListModel> sacoList;
  const SacoDashboard({super.key, required this.sacoList});

  @override
  State<SacoDashboard> createState() => _SacoDashboardState();
}

class _SacoDashboardState extends State<SacoDashboard> {
  @override
  Widget build(BuildContext context) {
    final sacoDashboardBloc = BlocProvider.of<SacoDashboardBloc>(context);

    return Scaffold(
      // extendBody: true,
      // appBar: AppBar(
      //   backgroundColor: AppColors.mainColor,
      // ),
      backgroundColor: const Color.fromARGB(255, 237, 240, 245),
      bottomNavigationBar: const CurvedNavBar(),
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                  height: 18.h,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                      color: AppColors.mainColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 15),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Hello, Mr. Surveryor",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white),
                                          textScaler: TextScaler.linear(
                                              TextScaleUtil.textScaleFactor(
                                                  context))),
                                      Text("Umaagos na pagbati!",
                                          style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                          textScaler: TextScaler.linear(
                                              TextScaleUtil.textScaleFactor(
                                                  context))),
                                    ],
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: const Image(
                                    image: AssetImage(
                                        'assets/images/sample_avatar.jpg'),
                                    height: 70,
                                    width: 70,
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  )),
              SizedBox(
                height: 15.h,
              ),
              //YOUR TASKS AND DROP DOWN
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        'YOUR TASKS'),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: const SacoListDropDown(),
                    )
                  ],
                ),
              ),
              //SACO LIST
              Expanded(
                flex: 9,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    child: BlocBuilder<SacoDashboardBloc, SacoDashboardState>(
                      builder: (context, state) {
                        //filter saco list based on drop down or search bar
                        List<SacoListModel> filteredSacoList = [];

                        //if search field has input and drop down is not set to ALL
                        if (sacoDashboardBloc.state.search != null &&
                            sacoDashboardBloc.state.search != '' &&
                            (sacoDashboardBloc.state.selectedStatus !=
                                    SacoStatus.all &&
                                sacoDashboardBloc.state.selectedStatus !=
                                    null)) {
                          filteredSacoList = widget.sacoList
                              .where((e) =>
                                  e.sacoStatus ==
                                      sacoDashboardBloc.state.selectedStatus &&
                                  (e.applicantName.toLowerCase().contains(
                                          sacoDashboardBloc.state.search
                                              ?.toLowerCase() as Pattern) ||
                                      e.sacoNumber.toLowerCase().contains(
                                          sacoDashboardBloc.state.search
                                              ?.toLowerCase() as Pattern)))
                              .toList();
                        }
                        //if search field has input and drop down is set to ALL
                        else if (sacoDashboardBloc.state.search != null &&
                            sacoDashboardBloc.state.search != '' &&
                            (sacoDashboardBloc.state.selectedStatus ==
                                    SacoStatus.all ||
                                sacoDashboardBloc.state.selectedStatus ==
                                    null)) {
                          filteredSacoList = widget.sacoList
                              .where((e) =>
                                  e.applicantName.toLowerCase().contains(
                                      sacoDashboardBloc.state.search
                                          ?.toLowerCase() as Pattern) ||
                                  e.sacoNumber.toLowerCase().contains(
                                      sacoDashboardBloc.state.search
                                          ?.toLowerCase() as Pattern))
                              .toList();
                        }
                        //if search field is empty and drop down is set to any of the options
                        else {
                          filteredSacoList = widget.sacoList
                              .where((e) =>
                                  e.sacoStatus ==
                                  sacoDashboardBloc.state.selectedStatus)
                              .toList();
                        }

                        //final saco list to show
                        List<SacoListModel> finalSacoList = [];

                        //if filtered list is not empty
                        if (filteredSacoList.isNotEmpty) {
                          finalSacoList = filteredSacoList;
                        }
                        //if search field is empty and drop down is set to ALL
                        else if ((sacoDashboardBloc.state.search == null ||
                                sacoDashboardBloc.state.search == '') &&
                            filteredSacoList.isEmpty &&
                            (sacoDashboardBloc.state.selectedStatus ==
                                    SacoStatus.all ||
                                sacoDashboardBloc.state.selectedStatus ==
                                    null)) {
                          finalSacoList = widget.sacoList;
                        } else {
                          finalSacoList = [];
                        }

                        switch (finalSacoList.length) {
                          case > 0:
                            return ListView.builder(
                                padding: const EdgeInsets.fromLTRB(0, 4, 0, 20),
                                itemCount: finalSacoList.length,
                                itemBuilder: (context, index) {
                                  return SacoListDetail(
                                    sacoNumber: finalSacoList[index].sacoNumber,
                                    applicantName:
                                        finalSacoList[index].applicantName,
                                    applicantAddress:
                                        finalSacoList[index].applicantAddress,
                                    sacoStatus: finalSacoList[index].sacoStatus,
                                    latitude: finalSacoList[index].latitude,
                                    longitude: finalSacoList[index].longitude,
                                  );
                                });
                          case <= 0:
                            return const Center(
                                child: Text(
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal),
                                    'NO RESULTS'));
                          default:
                            return ListView.builder(
                                padding: const EdgeInsets.fromLTRB(0, 4, 0, 20),
                                itemCount: widget.sacoList.length,
                                itemBuilder: (context, index) {
                                  return SacoListDetail(
                                    sacoNumber:
                                        widget.sacoList[index].sacoNumber,
                                    applicantName:
                                        widget.sacoList[index].applicantName,
                                    applicantAddress:
                                        widget.sacoList[index].applicantAddress,
                                    sacoStatus:
                                        widget.sacoList[index].sacoStatus,
                                    latitude: widget.sacoList[index].latitude,
                                    longitude: widget.sacoList[index].longitude,
                                  );
                                });
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

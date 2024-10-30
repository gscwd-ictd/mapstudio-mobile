import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mapstudio/common/enums/saco_status_enum.dart';
import 'package:mapstudio/data/models/saco_list_model.dart';
import 'package:mapstudio/domain/blocs/saco_dashboard_bloc/saco_dashboard_state.dart';
import '../../../../common/constants/colors.dart';
import '../../../../common/utils/text_scale_util.dart';
import '../../../../domain/blocs/saco_dashboard_bloc/saco_dashboard_bloc.dart';
import '../../../widgets/curved_navigation_bar/curved_navigation_bar.dart';
import '../../../widgets/saco_easy_animated_tab/saco_easy_animated_tab.dart';
import '../../../widgets/saco_list/saco_list_detail.dart';
import '../../../widgets/saco_list/saco_list_dropdown.dart';
import '../../../widgets/saco_search_field/saco_search_field.dart';

class SacoDashboard extends StatefulWidget {
  const SacoDashboard({super.key});

  @override
  State<SacoDashboard> createState() => _SacoDashboardState();
}

class _SacoDashboardState extends State<SacoDashboard> {
  @override
  Widget build(BuildContext context) {
    final sacoDashboardBloc = BlocProvider.of<SacoDashboardBloc>(context);

    List<SacoListModel> dummySacoList = [
      SacoListModel(
          sacoStatus: SacoStatus.newapplication,
          sacoNumber: "256854",
          applicantName: "Mark Dano",
          applicantAddress:
              "Block 5 Lot 10 Sarangani Homes Phase 1, Brgy. San Isidro General Santos City"),
      SacoListModel(
          sacoStatus: SacoStatus.inprogress,
          sacoNumber: "364866",
          applicantName: "John Henry Alf-Acheche",
          applicantAddress:
              "Block 2 Lot 12 Sarangani Homes Phase 2, Brgy. San Isidro General Santos City"),
      SacoListModel(
          sacoStatus: SacoStatus.completed,
          sacoNumber: "334610",
          applicantName: "Recardo Vincente Narvaiz",
          applicantAddress:
              "Block 11 Lot 320 Maldives Subdivision, Brgy. San Isidro General Santos City"),
      SacoListModel(
          sacoStatus: SacoStatus.forwarded,
          sacoNumber: "455672",
          applicantName: "Jelea Gleyn Nacerna",
          applicantAddress:
              "Block 1 Lot 23 Jolibee Homes, Brgy. Bula General Santos City"),
      SacoListModel(
          sacoStatus: SacoStatus.returned,
          sacoNumber: "321121",
          applicantName: "Aileen Joshua Tubero",
          applicantAddress:
              "Block 5 Lot 10 Saranganhi Homes Phase 1, Brgy. San Isidro General Santos City"),
      SacoListModel(
          sacoStatus: SacoStatus.forwarded,
          sacoNumber: "00005",
          applicantName: "Kara Kara Jane Ray Yes",
          applicantAddress:
              "Block 33 Lot 22 Mt. Matutum Subdivision, Brgy. Mabuhay General Santos City"),
      SacoListModel(
          sacoStatus: SacoStatus.newapplication,
          sacoNumber: "585524",
          applicantName: "Aimee Marcoss",
          applicantAddress:
              "Block 2 Lot 32 Sarangani Homes Phase 1, Brgy. San Isidro General Santos City"),
      SacoListModel(
          sacoStatus: SacoStatus.inprogress,
          sacoNumber: "874458",
          applicantName: "Ayan Spin Sir",
          applicantAddress:
              "Block 35 Lot 8 Sarangani Homes Phase 2, Brgy. San Isidro General Santos City"),
      SacoListModel(
          sacoStatus: SacoStatus.completed,
          sacoNumber: "334610",
          applicantName: "Ricky Gervaiz",
          applicantAddress:
              "Block 11 Lot 320 Maldives Subdivision, Brgy. San Isidro General Santos City"),
      SacoListModel(
          sacoStatus: SacoStatus.forwarded,
          sacoNumber: "455672",
          applicantName: "Jelea Gleyn Nacerna",
          applicantAddress:
              "Block 1 Lot 23 Jolibee Homes, Brgy. Bula General Santos City"),
      SacoListModel(
          sacoStatus: SacoStatus.returned,
          sacoNumber: "966582",
          applicantName: "Aileen Joshua Tubero",
          applicantAddress:
              "Block 15 Lot 45 Saranganhi Homes Phase 1, Brgy. San Isidro General Santos City"),
      SacoListModel(
          sacoStatus: SacoStatus.forwarded,
          sacoNumber: "122473",
          applicantName: "Kumeer Low Garancun",
          applicantAddress:
              "Block 23 Lot 1 Mt. Matutum Subdivision, Brgy. Mabuhay General Santos City"),
    ];

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
                  height: MediaQuery.of(context).size.height / 4.5,
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
              //SEARCH FIELD
              SacoSearchField(
                icon: FontAwesomeIcons.magnifyingGlass,
              ),
              //LIST AND MAP BUTTONS
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: SacoEasyAnimatedTab(
                    //buttonTitles are deisnged to only have 2 items in the array
                    buttonTitles: const <String>['List', 'Map'],
                    onSelected: (index) {},
                    minHeightOfItem: 20,
                    minWidthOfItem: MediaQuery.sizeOf(context).width * 0.50,
                    deActiveItemColor: Colors.white,
                    activeItemColor: const Color.fromARGB(255, 29, 41, 67),
                    deActiveTextStyle:
                        const TextStyle(color: Colors.black, fontSize: 16),
                    activeTextStyle:
                        const TextStyle(color: Colors.white, fontSize: 16),
                    deActiveBorderRadius: 50,
                    activeBorderRadius: 50,
                  ),
                ),
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
                          filteredSacoList = dummySacoList
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
                          filteredSacoList = dummySacoList
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
                          filteredSacoList = dummySacoList
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
                          finalSacoList = dummySacoList;
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
                                      sacoNumber:
                                          finalSacoList[index].sacoNumber,
                                      applicantName:
                                          finalSacoList[index].applicantName,
                                      applicantAddress:
                                          finalSacoList[index].applicantAddress,
                                      sacoStatus:
                                          finalSacoList[index].sacoStatus);
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
                                itemCount: dummySacoList.length,
                                itemBuilder: (context, index) {
                                  return SacoListDetail(
                                      sacoNumber:
                                          dummySacoList[index].sacoNumber,
                                      applicantName:
                                          dummySacoList[index].applicantName,
                                      applicantAddress:
                                          dummySacoList[index].applicantAddress,
                                      sacoStatus:
                                          dummySacoList[index].sacoStatus);
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

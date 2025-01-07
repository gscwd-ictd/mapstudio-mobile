import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mapstudio/app/screens/saco/saco_dashboard/saco_dashboard.dart';
import 'package:mapstudio/app/screens/saco/saco_map/saco_map.dart';
import 'package:mapstudio/app/widgets/saco_easy_animated_tab/saco_easy_animated_tab.dart';
import 'package:mapstudio/app/widgets/saco_search_field/saco_search_field.dart';
import 'package:sizer/sizer.dart';

import '../../../common/enums/saco_status_enum.dart';
import '../../../data/models/saco_list_model.dart';

class SacoTabView extends StatefulWidget {
  const SacoTabView({super.key});

  @override
  State<SacoTabView> createState() => _SacoTabViewState();
}

class _SacoTabViewState extends State<SacoTabView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  bool isMapVisible = false;
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {
        isMapVisible = tabController.index == 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<SacoListModel> dummySacoList = [
      SacoListModel(
        sacoStatus: SacoStatus.inprogress,
        sacoNumber: "256854",
        applicantName: "Mark Dano",
        applicantAddress:
            "Block 5 Lot 10 Sarangani Homes Phase 1, Brgy. San Isidro General Santos City",
        longitude: 6.1257211,
        latitude: 125.1939712,
      ),
      SacoListModel(
        sacoStatus: SacoStatus.newapplication,
        sacoNumber: "364866",
        applicantName: "John Henry Alf-Acheche",
        applicantAddress:
            "Block 2 Lot 12 Sarangani Homes Phase 2, Brgy. San Isidro General Santos City",
        longitude: 6.127977,
        latitude: 125.184778,
      ),
      SacoListModel(
        sacoStatus: SacoStatus.completed,
        sacoNumber: "334610",
        applicantName: "Recardo Vincente Narvaiz",
        applicantAddress:
            "Block 11 Lot 320 Maldives Subdivision, Brgy. San Isidro General Santos City",
        longitude: 6.126642,
        latitude: 125.181849,
      ),
      SacoListModel(
        sacoStatus: SacoStatus.completed,
        sacoNumber: "455672",
        applicantName: "Jelea Gleyn Nacerna",
        applicantAddress:
            "Block 1 Lot 23 Jolibee Homes, Brgy. Bula General Santos City",
        longitude: 6.122512,
        latitude: 125.181731,
      ),
      SacoListModel(
        sacoStatus: SacoStatus.returned,
        sacoNumber: "321121",
        applicantName: "Aileen Joshua Tubero",
        applicantAddress:
            "Block 5 Lot 10 Saranganhi Homes Phase 1, Brgy. San Isidro General Santos City",
        longitude: 6.119130,
        latitude: 125.181216,
      ),
      SacoListModel(
        sacoStatus: SacoStatus.newapplication,
        sacoNumber: "00005",
        applicantName: "Kara Kara Jane Ray Yes",
        applicantAddress:
            "Block 33 Lot 22 Mt. Matutum Subdivision, Brgy. Mabuhay General Santos City",
        longitude: 6.117424,
        latitude: 125.185561,
      ),
      SacoListModel(
        sacoStatus: SacoStatus.newapplication,
        sacoNumber: "585524",
        applicantName: "Aimee Marcoss",
        applicantAddress:
            "Block 2 Lot 32 Sarangani Homes Phase 1, Brgy. San Isidro General Santos City",
        longitude: 6.121033,
        latitude: 125.189123,
      ),
      SacoListModel(
        sacoStatus: SacoStatus.returned,
        sacoNumber: "874458",
        applicantName: "Ayan Spin Sir",
        applicantAddress:
            "Block 35 Lot 8 Sarangani Homes Phase 2, Brgy. San Isidro General Santos City",
        longitude: 6.1255063,
        latitude: 124.0637916,
      ),
      SacoListModel(
        sacoStatus: SacoStatus.completed,
        sacoNumber: "334610",
        applicantName: "Ricky Gervaiz",
        applicantAddress:
            "Block 11 Lot 320 Maldives Subdivision, Brgy. San Isidro General Santos City",
        longitude: 6.114577,
        latitude: 125.176249,
      ),
      SacoListModel(
        sacoStatus: SacoStatus.completed,
        sacoNumber: "455672",
        applicantName: "Jelea Gleyn Nacerna",
        applicantAddress:
            "Block 1 Lot 23 Jolibee Homes, Brgy. Bula General Santos City",
        longitude: 6.116040,
        latitude: 125.176377,
      ),
      SacoListModel(
        sacoStatus: SacoStatus.returned,
        sacoNumber: "966582",
        applicantName: "Aileen Joshua Tubero",
        applicantAddress:
            "Block 15 Lot 45 Saranganhi Homes Phase 1, Brgy. San Isidro General Santos City",
        longitude: 6.120447,
        latitude: 125.179317,
      ),
      SacoListModel(
        sacoStatus: SacoStatus.returned,
        sacoNumber: "122473",
        applicantName: "Kumeer Low Garancun",
        applicantAddress:
            "Block 23 Lot 1 Mt. Matutum Subdivision, Brgy. Mabuhay General Santos City",
        longitude: 6.122601,
        latitude: 125.184531,
      ),
    ];

    return Scaffold(
      body: Stack(
        children: [
          TabBarView(
            controller: tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              SacoDashboard(
                sacoList: dummySacoList,
              ),
              SacoMap(
                sacoList: dummySacoList,
              ),
            ],
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: isMapVisible ? 2.h : 18.h,
            child: SizedBox(
              height: 15.h,
              width: 100.w,
              child: Column(
                children: [
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
                        onSelected: (index) {
                          tabController.animateTo(index);
                        },
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
                ],
              ),
              // child: TabBar(
              //   controller: tabController,
              //   tabs: const [
              //     Tab(icon: Icon(Icons.music_note)),
              //     Tab(icon: Icon(Icons.music_video)),
              //   ],
              // ),
            ),
          )
        ],
      ),
    );
  }
}

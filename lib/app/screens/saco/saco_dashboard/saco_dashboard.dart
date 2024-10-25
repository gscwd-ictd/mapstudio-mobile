import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mapstudio/common/enums/saco_status_enum.dart';
import 'package:mapstudio/data/models/saco_list_model.dart';
import '../../../../common/constants/colors.dart';
import '../../../../common/utils/text_scale_util.dart';
import '../../../widgets/curved_navigation_bar/curved_navigation_bar.dart';
import '../../../widgets/saco_list/saco_list_detail.dart';
import '../../../widgets/saco_list/saco_list_dropdown.dart';
import '../../../widgets/text_form/text_form.dart';

class SacoDashboard extends StatefulWidget {
  const SacoDashboard({super.key});

  @override
  State<SacoDashboard> createState() => _SacoDashboardState();
}

class _SacoDashboardState extends State<SacoDashboard> {
  @override
  Widget build(BuildContext context) {
    List<SacoListModel> sacolist = [
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
              TextForm(
                icon: FontAwesomeIcons.magnifyingGlass,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
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
              Expanded(
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
                    child: ListView.builder(
                        padding: const EdgeInsets.fromLTRB(0, 4, 0, 20),
                        itemCount: sacolist.length,
                        itemBuilder: (context, index) {
                          return SacoListDetail(
                              sacoNumber: sacolist[index].sacoNumber,
                              applicantName: sacolist[index].applicantName,
                              applicantAddress:
                                  sacolist[index].applicantAddress,
                              sacoStatus: sacolist[index].sacoStatus);
                        }),
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

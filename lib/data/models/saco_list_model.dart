import 'package:mapstudio/data/models/pfdf_model.dart';

import '../../common/enums/saco_status_enum.dart';

class SacoListModel {
  final String sacoNumber;
  final String applicantName;
  final String applicantAddress;
  final SacoStatus sacoStatus;
  final double latitude;
  final double longitude;
  final List<PfdfModel> pfdf;

  SacoListModel(
      {required this.sacoNumber,
      required this.applicantName,
      required this.applicantAddress,
      required this.sacoStatus,
      required this.latitude,
      required this.longitude,
      required this.pfdf});
}

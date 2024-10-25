import '../../common/enums/saco_status_enum.dart';

class SacoListModel {
  final String sacoNumber;
  final String applicantName;
  final String applicantAddress;
  final SacoStatus sacoStatus;

  SacoListModel(
      {required this.sacoStatus,
      required this.sacoNumber,
      required this.applicantName,
      required this.applicantAddress});
}

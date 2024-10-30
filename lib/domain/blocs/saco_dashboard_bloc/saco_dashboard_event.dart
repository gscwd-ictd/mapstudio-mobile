import 'package:mapstudio/common/enums/saco_status_enum.dart';

abstract class SacoDashboardEvent {
  const SacoDashboardEvent();
}

class UpdateSacoDashboard extends SacoDashboardEvent {
  SacoStatus? selectedStatus;
  String? search;

  UpdateSacoDashboard({this.selectedStatus, this.search});
}

class InitializeSacoDashboard extends SacoDashboardEvent {
  InitializeSacoDashboard();
}

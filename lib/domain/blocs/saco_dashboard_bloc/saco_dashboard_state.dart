import 'package:mapstudio/common/enums/saco_status_enum.dart';

abstract class SacoDashboardState {
  SacoStatus? selectedStatus = SacoStatus.all;
  String? search = "";

  SacoDashboardState({this.selectedStatus, this.search});
}

class SacoDashboardStateInitial extends SacoDashboardState {
  SacoDashboardStateInitial();
}

class SacoDashboardLoading extends SacoDashboardState {
  SacoDashboardLoading({super.selectedStatus, super.search});
}

class SacoDashboardLoaded extends SacoDashboardState {
  SacoDashboardLoaded({super.selectedStatus, super.search});
}

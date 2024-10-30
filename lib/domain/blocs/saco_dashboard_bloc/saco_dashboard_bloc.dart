import 'package:bloc/bloc.dart';

import 'saco_dashboard_event.dart';
import 'saco_dashboard_state.dart';

class SacoDashboardBloc extends Bloc<SacoDashboardEvent, SacoDashboardState> {
  SacoDashboardBloc() : super(SacoDashboardStateInitial()) {
    on<InitializeSacoDashboard>(_initializeSacoDashboard);

    on<UpdateSacoDashboard>((event, emit) {
      emit(SacoDashboardLoading());
      emit(SacoDashboardLoaded(
          selectedStatus: event.selectedStatus, search: event.search));
    });
  }
}

void _initializeSacoDashboard(
    SacoDashboardEvent event, Emitter<SacoDashboardState> emit) async {}

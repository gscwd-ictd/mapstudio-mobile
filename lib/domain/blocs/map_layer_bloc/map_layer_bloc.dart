import 'package:bloc/bloc.dart';
import 'package:mapstudio/domain/blocs/map_layer_bloc/map_layer_event.dart';

import 'map_layer_state.dart';

class MapLayerBloc extends Bloc<MapLayerEvent, MapLayerState> {
  MapLayerBloc() : super(const MapLayerState()) {
    on<ChangeMapLayerEvent>(
      (event, emit) => emit(state.copyWith(currentLayer: event.currentLayer)),
    );
    on<InitializeMapLayer>(_initializeMapLayer);
  }
}

void _initializeMapLayer(
    MapLayerEvent event, Emitter<MapLayerState> emit) async {}

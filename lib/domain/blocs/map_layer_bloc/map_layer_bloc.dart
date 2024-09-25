import 'package:bloc/bloc.dart';
import 'package:mapstudio/domain/blocs/map_layer_bloc/map_layer_event.dart';

import 'map_layer_state.dart';

class MapLayerBloc extends Bloc<MapLayerEvent, MapLayerState> {
  MapLayerBloc() : super(MapLayerStateInitial()) {
    on<InitializeMapLayer>(_initializeMapLayer);
    on<UpdateMapLayer>((event, emit) {
      print(event.currentLayer);
      emit(MapLayerLoading());
      emit(MapLayerLoaded(currentLayer: event.currentLayer));
    });
  }
}

void _initializeMapLayer(
    MapLayerEvent event, Emitter<MapLayerState> emit) async {}

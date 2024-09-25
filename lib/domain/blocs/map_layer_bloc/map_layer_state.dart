import '../../../common/enums/map_layer_enum.dart';

abstract class MapLayerState {
  MapLayer? currentLayer = MapLayer.defaultosm;

  MapLayerState({this.currentLayer});
}

class MapLayerStateInitial extends MapLayerState {
  MapLayerStateInitial();
}

class MapLayerLoading extends MapLayerState {
  MapLayerLoading({super.currentLayer});
}

class MapLayerLoaded extends MapLayerState {
  MapLayerLoaded({super.currentLayer});
}

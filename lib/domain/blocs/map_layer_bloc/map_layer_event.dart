import '../../../common/enums/map_layer_enum.dart';

abstract class MapLayerEvent {
  const MapLayerEvent();
}

class UpdateMapLayer extends MapLayerEvent {
  final MapLayer currentLayer;

  UpdateMapLayer({required this.currentLayer});
}

class InitializeMapLayer extends MapLayerEvent {
  InitializeMapLayer();
}

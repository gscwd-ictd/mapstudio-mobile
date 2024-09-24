import 'package:equatable/equatable.dart';

import '../../../common/enums/map_layer_enum.dart';

class MapLayerState extends Equatable {
  final MapLayer currentLayer;

  const MapLayerState({
    this.currentLayer = MapLayer.defaultosm,
  });

  @override
  List<Object> get props => [currentLayer];

  MapLayerState copyWith({
    MapLayer? currentLayer,
  }) {
    return MapLayerState(
      currentLayer: currentLayer ?? this.currentLayer,
    );
  }
}

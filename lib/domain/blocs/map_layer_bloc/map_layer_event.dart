import 'package:equatable/equatable.dart';

import '../../../common/enums/map_layer_enum.dart';

abstract class MapLayerEvent extends Equatable {
  const MapLayerEvent();

  @override
  List<Object> get props => [];
}

class InitializeMapLayer extends MapLayerEvent {
  const InitializeMapLayer();
}

class ChangeMapLayerEvent extends MapLayerEvent {
  final MapLayer currentLayer; // declaration

  const ChangeMapLayerEvent({
    required this.currentLayer, // we recive the index of the navigation
  });

  @override
  List<Object> get props => [currentLayer]; // comparassion
}

import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import '../../../data/api/openroutesource_api.dart';

part 'map_route_event.dart';
part 'map_route_state.dart';

class MapRouteBloc extends Bloc<MapRouteEvent, MapRouteState> {
  MapRouteBloc() : super(MapRouteLoading(points: [])) {
    on<GetMapRouteRequest>(_getMapRouteRequest);
    on<InitializeMapRoute>(_initializeMapRoute);
  }

  void _initializeMapRoute(
      MapRouteEvent event, Emitter<MapRouteState> emit) async {}

  void _getMapRouteRequest(
      GetMapRouteRequest event, Emitter<MapRouteState> emit) async {
    final FlutterTts flutterTts = FlutterTts();

    emit(MapRouteLoading(points: []));
    bool isNotNull =
        event.startingPoint != 'null' && event.destinationPoint != 'null';
    bool isNotEmpty =
        event.startingPoint.isNotEmpty && event.destinationPoint.isNotEmpty;
    if (isNotNull && isNotEmpty) {
      var response = await http
          .get(getRouteUrl(event.startingPoint, event.destinationPoint));
      print(event.startingPoint);
      List listOfPoints = [];
      List<LatLng> points = [];

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        listOfPoints = data['features'][0]['geometry']['coordinates'];
        points = listOfPoints
            .map((e) => LatLng(e[1].toDouble(), e[0].toDouble()))
            .toList();
        print(response.body);
        print(points);
        print('mapRoutes updated');
        emit(MapRouteUpdated(
            points, event.startingPoint, event.destinationPoint));

        await flutterTts.setLanguage("en-US");
        await flutterTts.setSpeechRate(0.5);
        await flutterTts.setPitch(0.5);
        await flutterTts
            .setVoice({"name": "en-US-default", "locale": "eng-default"});
        await flutterTts.speak(
            "${data['features'][0]['properties']['segments'][0]['steps'][0]['instruction']} and ${data['features'][0]['properties']['segments'][0]['steps'][1]['instruction']}");
        // var voices = await flutterTts.getVoices;
        // print(data['features'][0]['properties']['segments'][0]['steps'][0]
        //     ['instruction']);
        // print(voices);
      } else {
        emit(MapRouteError(response.statusCode.toString()));
      }
    } else {
      emit(MapRouteError('Invalid Input'));
    }
  }
}
